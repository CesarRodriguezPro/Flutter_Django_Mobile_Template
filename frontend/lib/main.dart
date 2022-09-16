import 'package:flutter/material.dart';
import 'views/private_area/user_area.dart';
import 'views/security/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/":(context) =>  const Login(),
        "/user_area":(context) => const UserArea(),
      },
    );
  }
}
