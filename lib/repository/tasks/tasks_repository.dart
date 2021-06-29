import 'package:wundertusk/models/executor.dart';
import 'package:wundertusk/models/executors_list.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/task_doc.dart';
import 'package:wundertusk/models/task_docs_list.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/models/task_images_list.dart';
import 'package:wundertusk/models/tasks_list.dart';
import 'package:wundertusk/models/token.dart';
import 'package:wundertusk/models/user.dart';

abstract class TasksRepository {
  Future<TasksList> getTasksList();

  Future<Task> createTask({
    required String title,
    required DateTime deadline,
    List<String>? tags,
  });

  Future<bool> deleteTask(int id);

  Future<Task> getTaskById({
    required int id,
  });

  Future<TasksList> getFilteredTasksList(Map<String, dynamic> queryParameters);

  /// Executors

  Future<bool> addTaskExecutor({
    required Task task,
    required User user,
    required Token token,
  });

  Future<bool> addTaskExecutors({
    required Task task,
    required List<User> users,
  });

  Future<ExecutorsList> getTaskExecutorsList(
    Task task,
  );

  Future<bool> deleteTaskExecutor({
    required Task task,
    required Executor executor,
  });

  Future<bool> deleteTaskExecutors({
    required Task task,
    required List<Executor> executors,
  });

  /// Images

  Future<TaskImagesList> getTaskImagesList(int taskId);

  Future<TaskImage?> saveImageToTask(String imagePath, int taskId);

  Future<bool> deleteImageFromTask(int imageId, int taskId);

  /// Documents

  Future<TaskDocsList> getTaskDocsList(int taskId);

  Future<TaskDoc?> saveDocToTask(String docPath, int taskId);

  Future<bool> deleteDocFromTask(int docId, int taskId);
}
