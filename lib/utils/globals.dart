import 'package:flutter/foundation.dart';

class Global {
  static const String baseApiUrl = kDebugMode
      //? "http://192.168.0.143:5000/api" //Local Ubuntu VM
      ? "http://192.168.0.71:5000/api" //Local Windows Docker
      : "http://194.163.182.236:5000/api"; //Live Production API and DB
  static Map<String, String> baseApiHeader = {
    "Accept": "application/json",
    "content-type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
  };
  static Map<String, String> getHeaderWithAuthentication(String token) {
    var header = baseApiHeader;
    header["Authorization"] = "Bearer $token";
    return header;
  }

  static const Duration timeoutDuration = Duration(milliseconds: 7500);
}
