import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/task_doc.dart';

class TaskDocsList {
  int count;
  String? next;
  String? previous;
  List<TaskDoc> results;

  TaskDocsList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory TaskDocsList.empty() => TaskDocsList(
        count: 0,
        results: List<TaskDoc>.empty(growable: true),
      );

  factory TaskDocsList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return TaskDocsList.empty();

    return TaskDocsList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map((dynamic jsonTaskDoc) =>
              TaskDoc.fromJson(jsonTaskDoc as Map<String, dynamic>))
          .toList(),
    );
  }

  factory TaskDocsList.fromResponse(http.Response response) =>
      TaskDocsList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
