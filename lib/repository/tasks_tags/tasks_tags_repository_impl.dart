import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_tag/task_tag_remote_data_source.dart';
import 'package:wundertusk/repository/tasks_tags/tasks_tags_repository.dart';

class TasksTagsRepositoryImpl implements TasksTagsRepository {
  final TaskTagRemoteDataSource _tasksTagsRemoteDs;
  final TokenLocalDataSource _tokenLocalDs;

  TasksTagsRepositoryImpl(
    this._tasksTagsRemoteDs,
    this._tokenLocalDs,
  );

  @override
  Future<void> addTagsToTask({
    required int id,
    required List<String> tags,
  }) async {
    final token = await _tokenLocalDs.readToken();
    await _tasksTagsRemoteDs.addTagsToTask(
      taskId: id,
      tagNames: tags,
      tokenString: token!.asJwtToken,
    );
  }

  @override
  Future<void> deleteTagsFromTask({
    required int id,
    required List<String> tags,
  }) async {
    final token = await _tokenLocalDs.readToken();
    await _tasksTagsRemoteDs.deleteTagsFromTask(
      taskId: id,
      tagNames: tags,
      tokenString: token!.asJwtToken,
    );
  }
}
