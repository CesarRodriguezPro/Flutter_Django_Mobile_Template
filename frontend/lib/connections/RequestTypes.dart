import 'dart:developer';
import '../database/db.dart';
import './BasicUrl.dart';
import 'package:http/http.dart' as http;


Future<http.StreamedResponse> getRequest(String urlExtension)async{
  String apiKeySaved = await getApiKey();
  var headers = {
    'Authorization': 'TOKEN $apiKeySaved'
  };

  var request = http.Request('GET', Uri.parse('$rootApi/$urlExtension'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  return response;
}


Future<http.StreamedResponse> postRequest({required String apiUrl, required Map<String,String> data})async{
  var request = http.MultipartRequest('POST', Uri.parse('$rootApi/$apiUrl'));
  String apiKeySaved = await getApiKey();

  request.headers.addAll({
    'Authorization': 'TOKEN $apiKeySaved'
  });
  request.fields.addAll(data);
  http.StreamedResponse response = await request.send();
  return response;
}


Future<http.StreamedResponse> apiRequestWithPassword(String username, String password)async{
  var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8000/api-token-auth/'));

  request.fields.addAll({
    'username': username,
    'password': password
  });

  http.StreamedResponse response = await request.send();
  return response;
}


