// ignore_for_file: file_names
import 'dart:developer';
import '../database/db.dart';
import 'package:dio/dio.dart';
import '../url_base.dart';


Future<Response> getRequest(String urlExtension)async{
  // settings
  var key = await getApiKey();
  var url = "$basicUrl/apiUrl";

  // sending request
  var dio = Dio();
  Response response = await dio.post(url,
    options: Options(
      headers: {'Authorization': 'TOKEN $key'},
    ),
  );
  return response;
}


Future<Response> postRequest({required String apiUrl, required Map<String,String> data})async{
  // settings
  var key = await getApiKey();
  var url = "$basicUrl/apiUrl";

  // getting data
  FormData data_ = FormData.fromMap(data);

  // sending request
  var dio = Dio();
  Response response = await dio.post(url,
    data: data_,
    options: Options(
      headers: {'Authorization': 'TOKEN $key'},
    ),
  );
  return response;
}


Future<Response> apiRequestWithPassword(String username, String password)async{
  // settings
  var url = "$basicUrl/api-token-auth/";

  // getting data
  FormData data_ = FormData.fromMap({
    'username': username,
    'password': password
  });


  // sending request
  var dio = Dio();
  Response response = await dio.post(url,
    data: data_,
    options: Options(
    followRedirects: false,
    validateStatus: (status)=> status! < 500,
  ));
  return response;
  }



