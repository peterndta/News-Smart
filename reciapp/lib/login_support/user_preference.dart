// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyUserInfo = '';

  static SharedPreferences _preferences = _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future setUserInfo(String userInfo) async =>
      await _preferences.setString(_keyUserInfo, userInfo);
  static String getUserInfo() => _preferences.getString(_keyUserInfo) as String;
}
