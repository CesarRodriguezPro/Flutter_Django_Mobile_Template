import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveApiKey(String apiKey)async{
  await Hive.openBox('API');
  var apiBox = Hive.box('API');
  apiBox.put('token', apiKey);
}

Future<String> getApiKey()async{
  await Hive.openBox('API');
  var box =  Hive.box('API');
  String apiKey = await box.get('token');
  return apiKey;
}

Future<bool> hasApiKey()async{
  await Hive.openBox('API');
  var box =  Hive.box('API');
  String? apiKey = await box.get('token');
  return apiKey != null ? true : false;
}