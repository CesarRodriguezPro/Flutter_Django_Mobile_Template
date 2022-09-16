import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../database/db.dart';
import 'authenticate_local.dart';
import 'login_data.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _password = TextEditingController();
  final double _formSize = 220.0;

  getAndSetUsername()async{
    String? username = await getUsername();
    if (username != null){
      _login.text = username;
    }
  }

  @override
  void initState() {
    getAndSetUsername();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Image(
                //   image: AssetImage('images/logo.png'),
                //   width: 280,
                // ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: _formSize,
                  child: TextFormField(
                    controller: _login,
                    decoration: const InputDecoration(
                      labelText: "User Name",
                    ),
                  ),
                ),
                SizedBox(
                  width: _formSize,
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: (() async {
                      try
                      {
                        Response response = await loginToApi(_login.text, _password.text, context);

                        if(response.statusCode == 200)
                        {
                          Navigator.pushNamed(context, "/user_area");
                        }

                        else if (response.statusCode == 400)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Wrong Password Please Try Again')
                          ));
                        }

                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(response.statusMessage.toString())
                          ));
                        }
                      }
                      catch(error)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error.toString())
                        ));
                      }
                      // this will identify if the user can log in.

                    }),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: ()async{
                      authenticateApi(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.fingerprint),
                        Text("Authenticate"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

authenticateApi(context)async{
  final isAuthenticated = await AuthenticationService.authenticate();
  final hasApiKeyInStorage = await hasApiKey();
  final hasBiometric = await AuthenticationService.hasBiometrics();

  if(hasApiKeyInStorage)
  {
    if(hasBiometric)
    {
      if(isAuthenticated)
      {
        Navigator.pushNamed(context, "/user_area");
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Security Features needs to be active to use this function')
        ));
      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Biometrics Are Not Available')
      ));
    }
  }
  else
  {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please Login Manually')
    ));
  }
}