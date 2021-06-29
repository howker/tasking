import 'package:flutter/material.dart';
import 'package:wundertusk/models/executor.dart';

import 'package:wundertusk/models/executors_list.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';

class TaskExecutorsProvider extends ChangeNotifier {
  final TasksRepository _tasksRepo;

  ExecutorsList? get cachedTaskExecutorsList => _cachedTaskExecutorsList;

  List<Executor>? get cachedTaskExecutors => _cachedTaskExecutorsList?.results;

  List<User>? get cachedTaskExecutorsAsUsers =>
      _cachedTaskExecutorsList?.results.map((e) => e.user).toList();

  ExecutorsList? _cachedTaskExecutorsList;

  TaskExecutorsProvider(this._tasksRepo);

  Future<ExecutorsList> getTaskExecutorsList(Task task) =>
      _tasksRepo.getTaskExecutorsList(task);

  Future<void> loadTaskExecutorsList(Task task) async {
    _cachedTaskExecutorsList = await getTaskExecutorsList(task);
    notifyListeners();
  }

  Future<void> saveTaskExecutors(Task task, List<User> users) async {
    await loadTaskExecutorsList(task);

    final cachedExecutorsAsUsers =
        cachedTaskExecutors!.map((e) => e.user).toList();

    final usersToAdd = List<User>.empty(growable: true);
    final executorsToRemove = List<Executor>.empty(growable: true);

    // searching for users, which should be added and is not already added
    for (final user in users) {
      if (cachedExecutorsAsUsers.contains(user)) {
        continue;
      }
      usersToAdd.add(user);
    }

    // if newExecutors list shorter then cached,
    // it means that some of existing executors was removed from the list,
    // so we should delete unnecessary executors
    final usersToRemove =
        cachedExecutorsAsUsers.toSet().difference(users.toSet()).toList();
    if (usersToRemove.isNotEmpty) {
      for (final executor in cachedTaskExecutors!) {
        if (usersToRemove.contains(executor.user)) {
          executorsToRemove.add(executor);
        }
      }
    }

    final executorsWasDeleted = await _tasksRepo.deleteTaskExecutors(
      task: task,
      executors: executorsToRemove,
    );

    if (executorsWasDeleted) {
      for (final executorToRemove in executorsToRemove) {
        cachedTaskExecutors!.removeWhere(
          (cachedExecutor) => cachedExecutor.id == executorToRemove.id,
        );
      }
      notifyListeners();
    }

    final executorsWasAdded = await _tasksRepo.addTaskExecutors(
      task: task,
      users: usersToAdd,
    );

    // we can not receive executors locally because executor id sets on server side
    // in this case we obtain new data
    if (executorsWasAdded) {
      await loadTaskExecutorsList(task);
    }
  }

  Future<void> deleteTaskExecutor(Task task, Executor executor) async {
    final executorWasDeleted = await _tasksRepo.deleteTaskExecutor(
      task: task,
      executor: executor,
    );

    if (executorWasDeleted) {
      cachedTaskExecutors?.remove(executor);
      notifyListeners();
    }
  }
}
