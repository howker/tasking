import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/models/groups_list.dart';
import 'package:wundertusk/models/task/task.dart';

abstract class GroupRemoteDataSource extends RemoteDataSource {
  GroupRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<GroupsList> getGroupsList({
    required String tokenString,
  });

  Future<Group> createGroup({
    required String name,
    required String tokenString,
  });

  Future<List<Task>> getGroupTasksList({
    required String tokenString,
    required int groupId,
  });
}
