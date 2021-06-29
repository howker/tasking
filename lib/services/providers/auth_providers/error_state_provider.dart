import 'package:flutter/material.dart';

class ErrorStateProvider extends ChangeNotifier {
  bool errorState = false;
  bool emailErrorState = false;
  bool passwordErrorState = false;

  bool get getErrorState => errorState;

  void setNoErrorState() {
    errorState = false;
    notifyListeners();
  }

  void setErrorState() {
    errorState = true;
    notifyListeners();
  }
}
