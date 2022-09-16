import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationService {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics()async{
    try{
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e){
      log(e.toString());
      return false;
    }
  }

  static Future<bool> authenticate()async{
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try{
      return await _auth.authenticate(
        localizedReason: 'Please use Scan Face or Fingerprint',
        useErrorDialogs: false,
        stickyAuth: false,
      );



    } on PlatformException catch (e){
      log(e.toString());
      return false;
    }
  }

}