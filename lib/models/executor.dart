import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:wundertusk/models/user.dart';

@immutable
class Executor {
  final int id;
  final User user;

  @override
  int get hashCode => id.hashCode ^ user.hashCode;

  const Executor({
    required this.id,
    required this.user,
  });

  factory Executor.fromJson(Map<String, dynamic> json) => Executor(
        id: json['id'] as int,
        user: User.fromJson(json['executor'] as Map<String, dynamic>),
      );

  factory Executor.fromResponse(http.Response response) => Executor.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Executor &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          user == other.user;

  @override
  String toString() {
    return 'Executor{id: $id, user: $user}';
  }
}
