import 'package:flutter/material.dart';
import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/models/groups_list.dart';
import 'package:wundertusk/repository/group/group_repository.dart';

class GroupListProvider extends ChangeNotifier {
  final GroupRepository _groupRepo;
  final TextEditingController _groupNameController = TextEditingController();

  TextEditingController get groupNameController => _groupNameController;

  List<Group> get groups => _groups;
  List<Group> _groups = [];

  GroupListProvider(this._groupRepo) {
    fetchGroups();
  }

  Future<GroupsList> getGroupsList() async => _groupRepo.getGroupsList();

  Future<void> fetchGroups() async {
    final groupsList = await _groupRepo.getGroupsList();
    _groups = groupsList.results;
    notifyListeners();
  }

  Future<void> createGroup({required String name}) async {
    final group = await _groupRepo.createGroup(name: name);
    groups.add(group);
    notifyListeners();
  }
}
