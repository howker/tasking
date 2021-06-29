import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/comment.dart';

class CommentsList {
  int count;
  String? next;
  String? previous;
  List<Comment> results;

  CommentsList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory CommentsList.empty() => CommentsList(
        count: 0,
        results: List<Comment>.empty(),
      );

  factory CommentsList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return CommentsList.empty();

    return CommentsList(
      count: json['count'] as int,
      results: results.isEmpty
          ? List<Comment>.empty()
          : results
              .map((dynamic jsonComment) =>
                  Comment.fromJson(jsonComment as Map<String, dynamic>))
              .toList(),
    );
  }

  factory CommentsList.fromResponse(http.Response response) =>
      CommentsList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
