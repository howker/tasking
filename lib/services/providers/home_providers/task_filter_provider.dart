import 'package:flutter/material.dart';

class TaskFilterProvider extends ChangeNotifier {
  String taskPriority = '';

  String get getTaskPriority => taskPriority;

  void setTaskPriority(String priority) {
    taskPriority = priority;
    notifyListeners();
  }
}
