import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/executor.dart';

class ExecutorsList {
  int count;
  String? next;
  String? previous;
  List<Executor> results;

  ExecutorsList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory ExecutorsList.empty() => ExecutorsList(
        count: 0,
        results: List<Executor>.empty(growable: true),
      );

  factory ExecutorsList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return ExecutorsList.empty();

    return ExecutorsList(
      count: json['count'] as int,
      results: results.isEmpty
          ? List<Executor>.empty()
          : results
              .map((dynamic jsonExecutor) =>
                  Executor.fromJson(jsonExecutor as Map<String, dynamic>))
              .toList(),
    );
  }

  factory ExecutorsList.fromResponse(http.Response response) =>
      ExecutorsList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
