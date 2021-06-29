import 'package:flutter/material.dart';

import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/utils/string_reg_expressions.dart';

class SignUpProvider extends ChangeNotifier with SignUpValidator {
  final UserRepository _userRepo;

  String? get email => _email;

  String? get password => _password;

  String? get confirmationPassword => _confirmationPassword;

  String? get name => _name;

  String? get surname => _surname;

  String? get errorText => _errorText;

  String? _email;
  String? _password;
  String? _confirmationPassword;
  String? _name;
  String? _surname;
  String? _errorText;

  SignUpProvider(this._userRepo);

  void setEmail(String? value) {
    _email = value?.trim();
    notifyListeners();
  }

  void setPassword(String? value) {
    _password = value?.trim();
    notifyListeners();
  }

  void setConfirmationPassword(String? value) {
    _confirmationPassword = value?.trim();
    notifyListeners();
  }

  void setName(String? value) {
    _name = value?.trim();
    notifyListeners();
  }

  void setSurname(String? value) {
    _surname = value?.trim();
    notifyListeners();
  }

  /// Returns true, if email and password is valid
  Future<bool> validateAuthData() async {
    final emailValid = isEmailValid(_email);
    final passwordValid = isPasswordValid(_password);
    final confirmationPassValid = _password == _confirmationPassword;
    final authDataValid = emailValid && passwordValid && confirmationPassValid;

    if (!authDataValid) {
      if (!emailValid) {
        _errorText = 'Введите email';
      } else if (!passwordValid) {
        _errorText = 'Длина пароля должна превышать 5 символов';
      } else if (!confirmationPassValid) {
        _errorText = 'Пароли не совпадают';
      }
      notifyListeners();
      return false;
    }

    // check if email already in use
    final maybeUser = await _userRepo.getUserByEmail(_email!);
    final emailAlreadyInUse = maybeUser != null;

    if (emailAlreadyInUse) {
      _errorText = 'Данный e-mail уже зарегестрирован';
      notifyListeners();
      return false;
    }
    _errorText = null;
    notifyListeners();
    return true;
  }

  bool validatePersonalData() {
    final nameValid = isNameValid(_name);
    final surnameValid = isNameValid(_surname);
    final personalDataValid = nameValid && surnameValid;

    if (!personalDataValid) {
      if (!nameValid) {
        _errorText = 'Введите имя';
      } else if (!surnameValid) {
        _errorText = 'Введите фамилию';
      }
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<bool> signUp() async {
    final signUpAllowed = (await validateAuthData()) && validatePersonalData();

    if (signUpAllowed) {
      final signedUpUser = await _userRepo.registerUser(
        email: _email!,
        password: _password!,
        fullName: '$name $surname',
      );
      return signedUpUser != null;
    }
    return false;
  }
}

mixin SignUpValidator {
  bool isEmailValid(String? email) =>
      email != null &&
      email.isNotEmpty &&
      StringRegExpressions.emailRegExp.hasMatch(email);

  bool isPasswordValid(String? password) =>
      password != null && password.isNotEmpty && password.length > 5;

  bool isNameValid(String? name) => name != null && name.isNotEmpty;

  bool isSurnameValid(String? surname) => surname != null && surname.isNotEmpty;
}
