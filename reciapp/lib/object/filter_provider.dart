import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String paramsFilterCategory = '';
  List<String> selectedCheckbox = [];
  void changeInfomation() {
    selectedCheckbox = selectedCheckbox;
    paramsFilterCategory = paramsFilterCategory;
    notifyListeners();
  }
}

class CookingMethodsProvider with ChangeNotifier {
  String paramsFilterCookingMethods = '';

  void changeInfomation() {
    paramsFilterCookingMethods = paramsFilterCookingMethods;
    notifyListeners();
  }
}

class RecipesProvider with ChangeNotifier {
  String paramsFilterRecipes = '';

  void changeInfomation() {
    paramsFilterRecipes = paramsFilterRecipes;
    notifyListeners();
  }
}
