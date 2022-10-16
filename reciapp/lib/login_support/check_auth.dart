import 'package:flutter/material.dart';

class UserIDProvider with ChangeNotifier {
  String userID = '';

  void changeMail() {
    userID = userID;

    notifyListeners();
  }
}
