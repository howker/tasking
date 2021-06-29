import 'package:flutter/material.dart';

import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/repository/user/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _userRepo;

  User? get currentUser => _currentUser;
  User? _currentUser;

  UserProvider(this._userRepo);

  Future<void> loadUser(String email) async {
    _currentUser = await _userRepo.getUserByEmail(email);
    notifyListeners();
  }
}
