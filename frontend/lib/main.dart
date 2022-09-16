import 'package:flutter/material.dart';
import 'views/public_area/index.dart';
import 'views/private_area/user_area.dart';
import 'views/security/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './database/db.dart';

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
        "/":(context) => const Index(),
        "/login_area":(context) =>  Login(),
        "/user_area":(context) => UserArea(),
      },
    );
  }
}
