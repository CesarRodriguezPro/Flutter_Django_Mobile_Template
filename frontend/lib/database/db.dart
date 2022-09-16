import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveUsername(String username)async{
  await Hive.openBox('username');
  var apiBox = Hive.box('username');
  apiBox.put('token', username);
}

Future<String?> getUsername()async{
  await Hive.openBox('username');
  var box =  Hive.box('username');
  String? username = await box.get('token');
  return username;
}

void saveUserdata(Map userData)async{
  await Hive.openBox('userData');
  var apiBox = Hive.box('userData');
  apiBox.put('userData', userData);
}

Future<Map?> getUserData()async{
  await Hive.openBox('userData');
  var box =  Hive.box('userData');
  Map? userData = await box.get('userData');
  return userData;
}

// store apikey
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