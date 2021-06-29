import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/tag.dart';

class TagsList {
  int count;
  String? next;
  String? previous;
  List<Tag> results;

  TagsList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory TagsList.empty() => TagsList(
        count: 0,
        results: List<Tag>.empty(growable: true),
      );

  factory TagsList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return TagsList.empty();

    return TagsList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map((dynamic jsonTag) =>
              Tag.fromJson(jsonTag as Map<String, dynamic>))
          .toList(),
    );
  }

  factory TagsList.fromResponse(http.Response response) => TagsList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
