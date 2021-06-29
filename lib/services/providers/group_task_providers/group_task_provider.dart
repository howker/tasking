import 'package:flutter/material.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';
import 'package:wundertusk/repository/tasks_tags/tasks_tags_repository.dart';

class GroupTaskProvider extends ChangeNotifier {
  final TasksTagsRepository _tasksTagsRepo;
  final TasksRepository _tasksRepo;

  List<String> get tags => _tags;
  List<String> _tags = [];

  GroupTaskProvider(this._tasksTagsRepo, this._tasksRepo) {
    //getTaskTags();
  }

  Future<void> getTaskTags({required int id}) async {
    _tags = await _tasksRepo
        .getTaskById(id: id)
        .then((task) => List<String>.from(task.userTags));
    notifyListeners();
  }

  void addTagToTask({
    required int id,
    required String tag,
  }) {
    final tags = [tag];
    _tasksTagsRepo.addTagsToTask(id: id, tags: tags);
    _tags.add(tag);
    notifyListeners();
  }

  void deleteTagFromTask({
    required int id,
    required String tag,
  }) {
    final tags = [tag];
    _tasksTagsRepo.deleteTagsFromTask(id: id, tags: tags);
    _tags.remove(tag);
    notifyListeners();
  }
}
