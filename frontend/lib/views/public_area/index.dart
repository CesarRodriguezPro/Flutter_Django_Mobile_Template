import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text('Company Code'),
                TextButton(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/login_area')
                    },
                    child: Text('Login'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


