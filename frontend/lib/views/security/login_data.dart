import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../connections/RequestTypes.dart';
import 'package:dio/dio.dart';

Future loginToApi( _name, _password, context)async{
  try{
    Response response = await apiRequestWithPassword(_name, _password);
    return response;
  }
  on TimeoutException catch(e){
    log('hell world');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!)
    ));
  }
}
