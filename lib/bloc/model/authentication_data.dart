import 'package:projecthomestrategies_admin/bloc/model/user.dart';

class AuthenticationData {
  final String token;
  final User user;

  AuthenticationData({required this.token, required this.user});
}
