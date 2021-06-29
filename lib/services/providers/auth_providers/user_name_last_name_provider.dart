import 'package:flutter/material.dart';

class UserNameProvider extends ChangeNotifier {
  String userName = '';
  String userLastName = '';

  String get getUserName => userName;
  String get getUserLastName => userLastName;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void setUserLastName(String lastName) {
    userLastName = lastName;
    notifyListeners();
  }
}
