// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyUserID = '';
  static const _keyUserToken = '';
  static const _keyUserImageURL = '';
  static const _keyUserMail = '';
  static const _keyUserName = '';
  static const _keyUserRole = '';

  static SharedPreferences _preferences = _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //user ID
  // static Future setUserID(String userID, String token, String imageurl,
  //     String username, String mail, String role) async {
  //   await _preferences.setString(_keyUserID, userID);
  //   await _preferences.setString(_keyUserToken, token);
  //   await _preferences.setString(_keyUserImageURL, imageurl);
  //   await _preferences.setString(_keyUserName, username);
  //   await _preferences.setString(_keyUserMail, mail);
  //   await _preferences.setString(_keyUserRole, role);
  // }

  // static String getUserID() => _preferences.getString(_keyUserID) as String;
  // static String getToken() => _preferences.getString(_keyUserToken) as String;
  // static String getImageURL() =>
  //     _preferences.getString(_keyUserImageURL) as String;
  // static String getUsername() => _preferences.getString(_keyUserName) as String;
  // static String getRole() => _preferences.getString(_keyUserRole) as String;
  // static String getMail() => _preferences.getString(_keyUserMail) as String;

  // static Future setUserID(String userID) async =>
  //     await _preferences.setString(_keyUserID, userID);
  // static String getUserID() => _preferences.getString(_keyUserID) as String;

  static Future setToken(String token) async =>
      await _preferences.setString(_keyUserToken, token);
  static String getToken() => _preferences.getString(_keyUserToken) as String;

  // static Future setImageURL(String imageurl) async =>
  //     await _preferences.setString(_keyUserImageURL, imageurl);
  // static String getImageURL() =>
  //     _preferences.getString(_keyUserImageURL) as String;

  // static Future setUsername(String username) async =>
  //     await _preferences.setString(_keyUserName, username);
  // static String getUsername() => _preferences.getString(_keyUserName) as String;

  // static Future setMail(String mail) async =>
  //     await _preferences.setString(_keyUserMail, mail);
  // static String getMail() => _preferences.getString(_keyUserMail) as String;

  // static Future setRole(String role) async =>
  //     await _preferences.setString(_keyUserRole, role);
  // static String getRole() => _preferences.getString(_keyUserRole) as String;
}
