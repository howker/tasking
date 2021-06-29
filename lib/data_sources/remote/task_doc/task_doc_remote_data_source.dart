import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/task_doc.dart';
import 'package:wundertusk/models/task_docs_list.dart';

abstract class TaskDocRemoteDataSource extends RemoteDataSource {
  TaskDocRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<TaskDocsList> getTaskDocsList({
    required int taskId,
    required String tokenString,
  });

  Future<TaskDoc?> saveDocToTask({
    required int taskId,
    required String docPath,
    required String tokenString,
  });

  Future<bool> deleteDocFromTask({
    required int taskId,
    required int docId,
    required String tokenString,
  });
}
