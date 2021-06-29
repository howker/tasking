import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/task_image.dart';

/// Server response wrapper object with a list of images attached to the task
class TaskImagesList {
  /// All images count
  int count;

  /// Url to get next 20 images
  String? next;

  /// Url to get previous 20 images
  String? previous;

  /// List of images
  List<TaskImage> results;

  TaskImagesList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory TaskImagesList.empty() => TaskImagesList(
        count: 0,
        results: List<TaskImage>.empty(growable: true),
      );

  factory TaskImagesList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return TaskImagesList.empty();

    return TaskImagesList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map((dynamic jsonTaskImage) =>
              TaskImage.fromJson(jsonTaskImage as Map<String, dynamic>))
          .toList(),
    );
  }

  factory TaskImagesList.fromResponse(http.Response response) =>
      TaskImagesList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
