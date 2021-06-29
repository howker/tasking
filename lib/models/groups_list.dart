import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/group.dart';

class GroupsList {
  int count;
  String? next;
  String? previous;
  List<Group> results;

  GroupsList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory GroupsList.empty() => GroupsList(
        count: 0,
        results: List<Group>.empty(growable: true),
      );

  factory GroupsList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return GroupsList.empty();

    return GroupsList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map((dynamic jsonGroup) =>
              Group.fromJson(jsonGroup as Map<String, dynamic>))
          .toList(),
    );
  }

  factory GroupsList.fromResponse(http.Response response) =>
      GroupsList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
