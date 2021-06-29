import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/tasks_list.dart';

abstract class TaskRemoteDataSource extends RemoteDataSource {
  TaskRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<Task> createTask({
    required String title,
    required String deadline,
    required String tokenString,
  });

  Future<TasksList> getTasksList({
    required String tokenString,
  });

  Future<TasksList> getCurrentUserTasks({
    required String tokenString,
  });

  Future<Task> getTaskById({
    required int id,
    required String tokenString,
  });

  Future<Task?> changeTaskFieldsById({
    required int id,
    required String tokenString,
    String? title,
    DateTime? deadline,
    int? priority,
  });

  Future<bool> deleteTask({
    required int id,
    required String tokenString,
  });

  Future<TasksList> getFilteredTasksList({
    required Map<String, dynamic> queryParameters,
    required String tokenString,
  });
}
