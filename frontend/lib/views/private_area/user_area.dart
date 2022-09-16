import 'package:flutter/material.dart';

class UserArea extends StatelessWidget {
  const UserArea({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('User Area'),
              ],
            )
          ],
        ),
      ),
    );
  }
}