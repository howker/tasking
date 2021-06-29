import 'dart:convert';

import 'package:http/http.dart' as http;

class Tag {
  final int id;
  final String name;
  final int user;

  const Tag({
    required this.id,
    required this.name,
    required this.user,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json['id'] as int,
        name: json['name'] as String,
        user: json['user'] as int,
      );

  factory Tag.fromResponse(http.Response response) => Tag.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'user': user,
      };


}
