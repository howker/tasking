import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/task/task.dart';

class TasksList {
  int count;
  String? next;
  String? previous;
  List<Task> results;

  TasksList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory TasksList.empty() => TasksList(
        count: 0,
        results: List<Task>.empty(growable: true),
      );

  factory TasksList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return TasksList.empty();

    return TasksList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map((dynamic jsonTask) =>
              Task.fromJson(jsonTask as Map<String, dynamic>))
          .toList(),
    );
  }

  factory TasksList.fromResponse(http.Response response) => TasksList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
