import 'package:flutter/material.dart';

class UserLoginPassProvider extends ChangeNotifier {
  String userEmail = '';
  String userPassword = '';

  String get getUserEmail => userEmail;
  String get getUserPassword => userPassword;

  void setUserEmail(String email) {
    userEmail = email;
    notifyListeners();
  }

  void setUserPassword(String password) {
    userPassword = password;
    notifyListeners();
  }
}
