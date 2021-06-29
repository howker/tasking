import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

@immutable
class User {
  final String email;
  final String fullName;
  final int? id;
  final String? avatarUrl;

  @override
  int get hashCode =>
      email.hashCode ^ fullName.hashCode ^ id.hashCode ^ avatarUrl.hashCode;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as String,
        fullName: json['full_name'] as String,
        id: json['id'] as int?,
        avatarUrl: json['avatar_image'] as String?,
      );

  factory User.fromResponse(http.Response response) => User.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          fullName == other.fullName &&
          id == other.id &&
          avatarUrl == other.avatarUrl;

  @override
  String toString() {
    return 'User{email: $email, fullName: $fullName, id: $id, avatarUrl: $avatarUrl}';
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'full_name': fullName,
        'id': id,
        'url': avatarUrl,
      };

  User copyWith({
    String? email,
    String? fullName,
    String? avatarUrl,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
