import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ReqressStorage {
  static void setUserEmail(String email) async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    ls.setString('email', email);
  }

  static void setUserToken(String token) async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    ls.setString('access_token', token);
  }

  static containUserToken() async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    return ls.containsKey('access_token');
  }

  static getUserToken() async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    return ls.getString('access_token');
  }

  static getUserEmail() async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    return ls.getString('email');
  }

  static clearStorage() async {
    SharedPreferences ls = await SharedPreferences.getInstance();
    ls.clear();
  }
}
