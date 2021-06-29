import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/task/task.dart';

abstract class TaskTagRemoteDataSource extends RemoteDataSource {
  TaskTagRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<Task> addTagsToTask({
    required int taskId,
    required List<String> tagNames,
    required String tokenString,
  });

  Future<Task> deleteTagsFromTask({
    required int taskId,
    required List<String> tagNames,
    required String tokenString,
  });
}
