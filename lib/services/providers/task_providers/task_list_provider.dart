import 'package:flutter/material.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/tasks_list.dart';
import 'package:wundertusk/repository/group/group_repository.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';

enum TaskGroupFilter {
  allTasks,
  favorites,
  today,
  projects,
  tags,
}

class TaskListProvider extends ChangeNotifier {
  final TasksRepository _tasksRepo;
  final GroupRepository _groupRepo;

  TaskGroupFilter get currentFilter => _currentFilter;

  String get currentGroupName => _currentGroupName;

  List<Task>? get tasks => _tasks;

  List<Task>? get cachedTasks => _cachedTasksLists?.results;

  TasksList? _cachedTasksLists;
  List<Task>? _tasks;

  TaskGroupFilter _currentFilter = TaskGroupFilter.allTasks;
  String _currentGroupName = '';

  TaskListProvider(this._tasksRepo, this._groupRepo);

  Future<void> loadTasksList() async {
    _cachedTasksLists = await getTasksList();
    _tasks = _cachedTasksLists?.results;
    notifyListeners();
  }

  Future<TasksList> getTasksList() async => _tasksRepo.getTasksList();

  Future<void> createTask({
    required String title,
    required DateTime deadline,
    required List<String> tags,
  }) async {
    final createdTask = await _tasksRepo.createTask(
      title: title,
      deadline: deadline,
      tags: tags,
    );
    tasks?.add(createdTask);
    notifyListeners();
  }

  Future<bool> deleteTask(Task task) async {
    final taskWasDeleted = await _tasksRepo.deleteTask(task.id);
    if (taskWasDeleted) {
      tasks?.remove(task);
    }
    notifyListeners();
    return taskWasDeleted;
  }

  Future<List<Task>> getGroupTasksList(int groupId) async {
    final tasksList = await _groupRepo.getGroupTasksList(groupId);
    return tasksList;
  }

  Future<TasksList> getFilteredTasksList(
    Map<String, dynamic> queryParameters,
  ) async =>
      _tasksRepo.getFilteredTasksList(queryParameters);

  Future<void> setTasks({
    required TaskGroupFilter filter,
    required String groupName,
    int? groupId,
  }) async {
    _currentFilter = filter;
    _currentGroupName = groupName;
    notifyListeners();
    switch (_currentFilter) {
      case TaskGroupFilter.allTasks:
        await loadTasksList();
        break;
      case TaskGroupFilter.favorites:
        // TODO(someone): add favorite tasks
        break;
      case TaskGroupFilter.today:
        _tasks = tasks!
            .where((task) => task.deadline?.day == DateTime.now().day)
            .toList();
        notifyListeners();
        break;
      case TaskGroupFilter.projects:
        if (groupId == null) {
          throw Exception('Group id is empty');
        }
        _tasks = await getGroupTasksList(groupId);
        notifyListeners();
        break;
      case TaskGroupFilter.tags:
        final queryParameters = {
          'tags': groupName,
        };
        _cachedTasksLists = await getFilteredTasksList(queryParameters);
        _tasks = _cachedTasksLists?.results;
        break;
    }
  }
}
