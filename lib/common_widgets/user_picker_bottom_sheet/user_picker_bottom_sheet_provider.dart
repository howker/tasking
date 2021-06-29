import 'package:flutter/material.dart';
import 'package:wundertusk/models/user.dart';

class UserPickerBottomSheetProvider extends ChangeNotifier {
  final List<User> _pickedUsers = List<User>.empty(growable: true);

  List<User> get pickedUsers => _pickedUsers;

  UserPickerBottomSheetProvider({
    List<User>? predefinedUsers,
  }) {
    if (predefinedUsers != null) {
      _pickedUsers.addAll(predefinedUsers);
    }
  }

  void pickUser(User user) {
    if (_pickedUsers.contains(user)) return;

    _pickedUsers.add(user);
    notifyListeners();
  }

  void removeUser(User user) {
    if (!_pickedUsers.contains(user)) return;

    _pickedUsers.remove(user);
    notifyListeners();
  }

  bool hasUser(User user) => _pickedUsers.contains(user);
}
