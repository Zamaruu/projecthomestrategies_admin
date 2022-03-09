// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:convert';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:projecthomestrategies_admin/bloc/model/api_response.dart';
import 'package:projecthomestrategies_admin/bloc/model/authentication_data.dart';
import 'package:projecthomestrategies_admin/bloc/model/user.dart';
import 'package:projecthomestrategies_admin/service/authentication_service.dart';

class AuthenticationState with ChangeNotifier {
  late User _currentUser;
  User get currentUser => _currentUser;
  String? get getToken => window.sessionStorage['localHsAuthToken'];

  void setToken(String token) {
    window.sessionStorage['localHsAuthToken'] = token.trim();
  }

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<bool> tokenExpired() async {
    if (getToken == null) {
      return true;
    } else {
      var response = await AuthenticationService().checkToken(getToken!);
      if (response.statusCode != 200) {
        return true;
      }
    }

    return false;
  }

  String _encodeCredentials(String email, String password) {
    var rawCredentials = "$email:$password";
    var bytes = utf8.encode(rawCredentials);
    return base64.encode(bytes);
  }

  Future<ApiResponse> signInWithCredentials(
    String email,
    String password,
  ) async {
    var credentials = _encodeCredentials(email, password);

    var response = await AuthenticationService().signInWithCredentials(
      credentials,
    );

    if (response.statusCode == 200) {
      var auth = response.object as AuthenticationData;

      setToken(auth.token);
      setUser(auth.user);

      return response;
    } else {
      return response;
    }
  }
}
