import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/remote/group/group_remote_data_source.dart';
import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/models/groups_list.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/repository/group/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  final GroupRemoteDataSource _groupRemoteDs;
  final TokenLocalDataSource _tokenLocalDs;

  GroupRepositoryImpl(
    this._groupRemoteDs,
    this._tokenLocalDs,
  );

  @override
  Future<Group> createGroup({
    required String name,
  }) async {
    final token = await _tokenLocalDs.readToken();
    final group = await _groupRemoteDs.createGroup(
      name: name,
      tokenString: token!.asJwtToken,
    );
    return group;
  }

  @override
  Future<GroupsList> getGroupsList() async {
    final token = await _tokenLocalDs.readToken();
    final groupList = await _groupRemoteDs.getGroupsList(
      tokenString: token!.asJwtToken,
    );
    return groupList;
  }

  @override
  Future<List<Task>> getGroupTasksList(int groupId) async {
    final token = await _tokenLocalDs.readToken();
    final tasksList = await _groupRemoteDs.getGroupTasksList(
      tokenString: token!.asJwtToken,
      groupId: groupId,
    );
    return tasksList;
  }
}
