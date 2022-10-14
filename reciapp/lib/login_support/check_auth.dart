import 'package:flutter/material.dart';

class UserIDProvider with ChangeNotifier {
  int userID = 0;

  void changeMail() {
    userID = userID;

    notifyListeners();
  }
}
