import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projecthomestrategies_admin/bloc/model/api_response.dart';
import 'package:projecthomestrategies_admin/bloc/model/authentication_data.dart';
import 'package:projecthomestrategies_admin/bloc/model/user.dart';
import 'package:projecthomestrategies_admin/utils/globals.dart';

class AuthenticationService {
  late String url;
  late Map<String, String> header;

  AuthenticationService() {
    url = Global.baseApiUrl;
    header = Global.baseApiHeader;
  }

  Future<ApiResponse> checkToken(String token) async {
    try {
      final rawUri = url + "/Auth/CheckToken";

      final uri = Uri.parse(rawUri);

      var response = await http
          .post(
            uri,
            headers: Global.getHeaderWithAuthentication(token),
          )
          .timeout(Global.timeoutDuration);

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return ApiResponse.error(
            response.statusCode,
            "Die Antwort des Servers ist Fehlerhaft",
          );
        }

        return ApiResponse.success(
          response.statusCode,
          response.body,
        );
      } else {
        return ApiResponse.error(response.statusCode, response.body);
      }
    } on TimeoutException catch (e) {
      return ApiResponse.error(408, e.toString());
    } on Exception catch (e) {
      return ApiResponse.error(500, e.toString());
    }
  }

  Future<ApiResponse> signInWithCredentials(String credentials) async {
    try {
      final rawUri = url + "/Auth/signin/$credentials";

      final uri = Uri.parse(rawUri);

      var response = await http
          .post(
            uri,
            headers: Global.baseApiHeader,
          )
          .timeout(Global.timeoutDuration);

      if (response.statusCode == 200 || response.statusCode == 307) {
        if (response.body.isEmpty) {
          return ApiResponse.error(
            response.statusCode,
            "Die Antwort des Servers ist Fehlerhaft",
          );
        }

        //getting auth token
        var body = jsonDecode(response.body);

        return ApiResponse.success(
          response.statusCode,
          AuthenticationData(
            token: body["token"],
            user: User.fromJson(body["user"]),
          ),
        );
      } else {
        return ApiResponse.error(response.statusCode, response.body);
      }
    } on TimeoutException catch (e) {
      return ApiResponse.error(408, e.toString());
    } on Exception catch (e) {
      return ApiResponse.error(500, e.toString());
    }
  }
}
