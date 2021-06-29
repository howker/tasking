import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/remote/executors/executors_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_doc/task_doc_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task/task_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_tag/task_tag_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_image/task_image_remote_data_source.dart';
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
import 'package:wundertusk/repository/tasks/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TaskRemoteDataSource _tasksRemoteDs;
  final TaskTagRemoteDataSource _taskTagsRemoteDs;
  final ExecutorsRemoteDataSource _executorsRemoteDs;
  final TaskImageRemoteDataSource _taskImagesRemoteDs;
  final TaskDocRemoteDataSource _taskDocsRemoteDs;
  final TokenLocalDataSource _tokenLocalDs;

  TasksRepositoryImpl(
    this._tasksRemoteDs,
    this._taskTagsRemoteDs,
    this._executorsRemoteDs,
    this._taskImagesRemoteDs,
    this._taskDocsRemoteDs,
    this._tokenLocalDs,
  );

  @override
  Future<TasksList> getTasksList() async {
    final token = await _tokenLocalDs.readToken();
    final tasksList = await _tasksRemoteDs.getTasksList(
      tokenString: token!.asJwtToken,
    );
    return tasksList;
  }

  @override
  Future<Task> createTask({
    required String title,
    required DateTime deadline,
    List<String>? tags,
  }) async {
    final deadlineAsString = deadline.toIso8601String();
    final token = await _tokenLocalDs.readToken();
    final createdTask = await _tasksRemoteDs.createTask(
      title: title,
      deadline: deadlineAsString,
      tokenString: token!.asJwtToken,
    );

    if (tags != null) {
      final token = await _tokenLocalDs.readToken();
      await _taskTagsRemoteDs.addTagsToTask(
        taskId: createdTask.id,
        tagNames: tags,
        tokenString: token!.asJwtToken,
      );
    }
    return createdTask;
  }

  @override
  Future<bool> deleteTask(int id) async {
    final token = await _tokenLocalDs.readToken();
    final isSuccess = await _tasksRemoteDs.deleteTask(
      id: id,
      tokenString: token!.asJwtToken,
    );
    return isSuccess;
  }

  @override
  Future<Task> getTaskById({
    required int id,
  }) async {
    final token = await _tokenLocalDs.readToken();
    final task = await _tasksRemoteDs.getTaskById(
      id: id,
      tokenString: token!.asJwtToken,
    );
    return task;
  }

  @override
  Future<TasksList> getFilteredTasksList(
    Map<String, dynamic> queryParameters,
  ) async {
    final token = await _tokenLocalDs.readToken();
    final tasksList = await _tasksRemoteDs.getFilteredTasksList(
      queryParameters: queryParameters,
      tokenString: token!.asJwtToken,
    );
    return tasksList;
  }

  @override
  Future<bool> addTaskExecutor({
    required Task task,
    required User user,
    required Token token,
  }) async =>
      _executorsRemoteDs.addTaskExecutor(
        taskId: task.id,
        userId: user.id!,
        tokenString: token.asJwtToken,
      );

  @override
  Future<bool> addTaskExecutors({
    required Task task,
    required List<User> users,
  }) async {
    if (users.isEmpty) return false;

    for (final user in users) {
      final token = await _tokenLocalDs.readToken();
      await addTaskExecutor(task: task, user: user, token: token!);
    }
    return true;
  }

  @override
  Future<ExecutorsList> getTaskExecutorsList(Task task) async {
    final token = await _tokenLocalDs.readToken();
    final executorsList = await _executorsRemoteDs.getTaskExecutorsList(
      taskId: task.id,
      tokenString: token!.asJwtToken,
    );
    return executorsList;
  }

  @override
  Future<bool> deleteTaskExecutor({
    required Task task,
    required Executor executor,
  }) async {
    final token = await _tokenLocalDs.readToken();
    final isSuccess = await _executorsRemoteDs.deleteTaskExecutor(
      taskId: task.id,
      executorId: executor.id,
      tokenString: token!.asJwtToken,
    );
    return isSuccess;
  }

  @override
  Future<bool> deleteTaskExecutors({
    required Task task,
    required List<Executor> executors,
  }) async {
    if (executors.isEmpty) return false;

    for (final executor in executors) {
      await deleteTaskExecutor(task: task, executor: executor);
    }
    return true;
  }

  @override
  Future<TaskImagesList> getTaskImagesList(int taskId) async {
    final token = await _tokenLocalDs.readToken();
    final taskImagesList = await _taskImagesRemoteDs.getTaskImagesList(
      taskId: taskId,
      tokenString: token!.asJwtToken,
    );
    return taskImagesList;
  }

  @override
  Future<TaskImage?> saveImageToTask(String imagePath, int taskId) async =>
      _taskImagesRemoteDs.saveImageToTask(taskId: taskId, imagePath: imagePath);

  @override
  Future<bool> deleteImageFromTask(int imageId, int taskId) async =>
      _taskImagesRemoteDs.deleteImageFromTask(taskId: taskId, imageId: imageId);

  @override
  Future<TaskDocsList> getTaskDocsList(int taskId) async {
    final token = await _tokenLocalDs.readToken();
    final taskDocsList = await _taskDocsRemoteDs.getTaskDocsList(
      taskId: taskId,
      tokenString: token!.asJwtToken,
    );
    return taskDocsList;
  }

  @override
  Future<TaskDoc?> saveDocToTask(String docPath, int taskId) async {
    final token = await _tokenLocalDs.readToken();
    return _taskDocsRemoteDs.saveDocToTask(
      taskId: taskId,
      docPath: docPath,
      tokenString: token!.asJwtToken,
    );
  }

  @override
  Future<bool> deleteDocFromTask(int docId, int taskId) async {
    final token = await _tokenLocalDs.readToken();
    return _taskDocsRemoteDs.deleteDocFromTask(
      taskId: taskId,
      docId: docId,
      tokenString: token!.asJwtToken,
    );
  }
}
