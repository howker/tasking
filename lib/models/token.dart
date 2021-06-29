import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Token {
  final String? value;
  final int? tokenLifetime;

  String get asJwtToken => 'jwt $value';

  const Token({
    required this.value,
    this.tokenLifetime,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      value: json['token'] as String,
      tokenLifetime: json['token_lifetime'] as int?,
    );
  }

  /// Creates new token from a given JSON string
  factory Token.decode(String jsonString) => Token.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );

  /// Compares the value of this token with the value of the passed token
  bool isEqualTo(Token? token) {
    if (token == null) return false;
    return value == token.value;
  }

  /// Converts this token to a JSON string
  String encode() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': value,
      };
}
