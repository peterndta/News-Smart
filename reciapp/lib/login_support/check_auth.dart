import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String userID = '';
  String token = '';
  String imageURL = '';
  String name = '';
  String role = '';
  String mail = '';
  void changeInfomation() {
    userID = userID;
    token = token;
    imageURL = imageURL;
    name = name;
    role = role;
    mail = mail;
    notifyListeners();
  }
}
