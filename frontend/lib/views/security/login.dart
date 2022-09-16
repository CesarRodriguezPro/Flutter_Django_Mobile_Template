import 'dart:developer';
import 'package:flutter/material.dart';
import 'login_data.dart';

class Login extends StatelessWidget {
   Login({ Key? key }) : super(key: key);
 final _login = TextEditingController();
 final _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                        controller: _login,
                          decoration: const InputDecoration(
                            labelText: "User Name",
                          ),
                    ),
                  ),   
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                        controller: _password,
                        obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                      child: const Text('Log In'),
                      onPressed: (() => {
                        loginToApi(_login, _password, context)
                      }),
              ),
                  )
              ],
            )
           ],
        ),
      ),
    );
  }
}