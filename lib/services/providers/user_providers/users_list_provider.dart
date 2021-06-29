import 'package:flutter/material.dart';

import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/models/users_list.dart';
import 'package:wundertusk/repository/user/user_repository.dart';

class UsersListProvider extends ChangeNotifier {
  final UserRepository _userRepo;

  final List<User> _loadedUsers = List<User>.empty(growable: true);

  List<User> get loadedUsers => _loadedUsers;

  UsersList? get cachedUsersList => _cachedUsersList;

  UsersList? _cachedUsersList;

  UsersListProvider(this._userRepo);

  Future<void> loadUsersList() async {
    _cachedUsersList = await getUsersList();
    _loadedUsers.addAll(_cachedUsersList!.results);
    notifyListeners();
  }

  Future<UsersList> getUsersList({
    String? sourceUrl,
  }) async =>
      _userRepo.getUsersList(sourceUrl: sourceUrl);

  Future<void> tryLoadNextUsers() async {
    if (_cachedUsersList?.next == null) return;

    _cachedUsersList = await getUsersList(sourceUrl: _cachedUsersList!.next);

    if (_cachedUsersList!.results.isEmpty) return;

    _loadedUsers.addAll(_cachedUsersList!.results);
    notifyListeners();
  }
}
