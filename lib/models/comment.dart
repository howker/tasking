import 'dart:convert';

import 'package:http/http.dart' as http;

class Comment {
  int author;
  int level;
  int parent;
  String text;
  int treeId;

  Comment({
    required this.author,
    required this.level,
    required this.parent,
    required this.text,
    required this.treeId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        author: json['author'] as int,
        level: json['level'] as int,
        parent: json['parent'] as int,
        text: json['text'] as String,
        treeId: json['tree_id'] as int,
      );

  factory Comment.fromResponse(http.Response response) => Comment.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );
}
