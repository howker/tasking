import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/models/user.dart';

class UsersList {
  int count;
  String? next;
  String? previous;
  List<User> results;

  UsersList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory UsersList.empty() => UsersList(
        count: 0,
        results: List<User>.empty(growable: true),
      );

  factory UsersList.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    if (results.isEmpty) return UsersList.empty();

    return UsersList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: results
          .map<User>((dynamic jsonUser) =>
              User.fromJson(jsonUser as Map<String, dynamic>))
          .toList(),
    );
  }

  factory UsersList.decode(String jsonString) => UsersList.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );

  factory UsersList.fromResponse(http.Response response) => UsersList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
