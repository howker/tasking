import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';

class TaskCreateProvider {
  final TasksRepository _tasksRepo;

  String? createdTaskTitle;
  DateTime? createdTaskDeadline;

  TaskCreateProvider(this._tasksRepo);

  Future<Task?> createTask() async {
    if (createdTaskTitle != null) {
      return _tasksRepo.createTask(
        title: createdTaskTitle!,
        deadline: createdTaskDeadline ?? DateTime.now(),
      );
    }
  }
}
