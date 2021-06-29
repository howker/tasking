import 'package:flutter/material.dart';

class NewTaskProvider extends ChangeNotifier {
  final List<String> _tags = [];

  List<int> repeatDays = [];

  List<String> get tags => _tags;

  void addRepeatDay(int index) {
    repeatDays.add(index);
    notifyListeners();
  }

  void removeRepeatDay(int index) {
    repeatDays.remove(index);
    notifyListeners();
  }

  void addTagToTask(String tag) {
    _tags.add(tag);
    notifyListeners();
  }

  void deleteTagFromTask(String tag) {
    _tags.remove(tag);
    notifyListeners();
  }
}
