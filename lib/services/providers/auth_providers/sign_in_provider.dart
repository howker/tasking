import 'package:flutter/material.dart';

import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/utils/string_reg_expressions.dart';

class SignInProvider extends ChangeNotifier with SignInValidator {
  final UserRepository _userRepo;

  String? get email => _email;

  String? get password => _password;

  String? get errorText => _errorText;

  String? _email;
  String? _password;
  String? _errorText;

  SignInProvider(this._userRepo);

  void setEmail(String? value) {
    _email = value?.trim();
    notifyListeners();
  }

  void setPassword(String? value) {
    _password = value?.trim();
    notifyListeners();
  }

  Future<bool> signIn() async {
    final emailValid = isEmailValid(_email);
    final passwordValid = isPasswordValid(_password);

    if (emailValid && passwordValid) {
      final isSignedIn = await _userRepo.login(
        email: _email!,
        password: _password!,
      );

      if (isSignedIn) {
        _errorText = null;
      } else {
        _errorText = 'Неверно указан e-mail или пароль';
      }

      notifyListeners();
      return isSignedIn;
    }

    if (!emailValid && !passwordValid) {
      _errorText = 'Введите e-mail и пароль';
    } else if (!emailValid) {
      _errorText = 'Введите e-mail';
    } else if (!passwordValid) {
      _errorText = 'Введите пароль';
    }

    notifyListeners();
    return false;
  }
}

mixin SignInValidator {
  bool isEmailValid(String? email) =>
      email != null &&
      email.isNotEmpty &&
      StringRegExpressions.emailRegExp.hasMatch(email);

  bool isPasswordValid(String? password) =>
      password != null && password.isNotEmpty;
}
