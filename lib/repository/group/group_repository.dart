import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/models/groups_list.dart';
import 'package:wundertusk/models/task/task.dart';

abstract class GroupRepository {
  Future<Group> createGroup({
    required String name,
  });

  Future<GroupsList> getGroupsList();

  Future<List<Task>> getGroupTasksList(int groupId);
}
