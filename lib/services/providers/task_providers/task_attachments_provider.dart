import 'package:flutter/material.dart';

import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/task_doc.dart';
import 'package:wundertusk/models/task_docs_list.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/models/task_images_list.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';

/// Provider which handle all task attachments.
/// Such as images, files, audio, etc.
class TaskAttachmentsProvider extends ChangeNotifier {
  final _imgSupportedExtensions = <String>[
    'jpg',
    'jpeg',
    'png',
  ];
  final _docSupportedExtensions = <String>[
    'pdf',
    'doc',
    'docx',
    'txt',
    'rtf',
    'xlsx',
    'xls',
  ];
  final _audioSupportedExtensions = <String>[
    'mp3',
    'ogg',
    'wav',
    'flac',
    'wma',
  ];
  final TasksRepository _tasksRepo;

  TaskImagesList? get cachedTaskImages => _cachedTaskImagesList;

  List<TaskImage>? get cachedImages => _cachedTaskImagesList?.results;

  TaskDocsList? get cachedTaskDocs => _cachedTaskDocsList;

  List<TaskDoc>? get cachedDocs => _cachedTaskDocsList?.results;

  TaskImagesList? _cachedTaskImagesList;
  TaskDocsList? _cachedTaskDocsList;

  TaskAttachmentsProvider(this._tasksRepo);

  Future<void> fetchTaskImagesList(Task task) async {
    _cachedTaskImagesList = await getTaskImagesList(task);
    notifyListeners();
  }

  Future<TaskImagesList> getTaskImagesList(Task task) async =>
      _tasksRepo.getTaskImagesList(task.id);

  Future<void> fetchTaskDocsList(Task task) async {
    _cachedTaskDocsList = await getTaskDocsList(task);
    notifyListeners();
  }

  Future<TaskDocsList> getTaskDocsList(Task task) async =>
      _tasksRepo.getTaskDocsList(task.id);

  Future<void> saveFileToTask(String localPath, Task task) async {
    final fileExtension = localPath.split('.').last;
    if (_imgSupportedExtensions.contains(fileExtension)) {
      final taskImage = await _tasksRepo.saveImageToTask(localPath, task.id);
      if (taskImage != null) {
        _cachedTaskImagesList!.results.add(taskImage);
      }
    } else if (_docSupportedExtensions.contains(fileExtension)) {
      final taskDoc = await _tasksRepo.saveDocToTask(localPath, task.id);
      if (taskDoc != null) {
        _cachedTaskDocsList!.results.add(taskDoc);
      }
    }
    notifyListeners();
  }

  Future<void> saveFilesToTask(List<String?> localPaths, Task task) async {
    for (final localPath in localPaths) {
      if (localPath != null) {
        await saveFileToTask(localPath, task);
      }
    }
  }

  Future<bool> deleteImageFromTask(TaskImage image) async {
    final imageWasDeleted = await _tasksRepo.deleteImageFromTask(
      image.id,
      image.taskId,
    );
    if (imageWasDeleted) {
      _cachedTaskImagesList!.results.remove(image);
      notifyListeners();
    }
    return imageWasDeleted;
  }

  Future<bool> deleteDocFromTask(TaskDoc doc) async {
    final docWasDeleted = await _tasksRepo.deleteDocFromTask(
      doc.id,
      doc.taskId,
    );
    if (docWasDeleted) {
      _cachedTaskDocsList!.results.remove(doc);
      notifyListeners();
    }
    return docWasDeleted;
  }
}
