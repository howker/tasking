import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskDoc {
  final int id;
  final int taskId;
  final String url;
  String? comment;

  TaskDoc({
    required this.id,
    required this.taskId,
    required this.url,
    this.comment,
  });

  factory TaskDoc.fromJson(Map<String, dynamic> json) => TaskDoc(
        id: json['id'] as int,
        taskId: json['task'] as int,
        url: json['doc_file'] as String,
        comment: json['comment'] as String?,
      );

  factory TaskDoc.fromResponse(http.Response response) => TaskDoc.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'task': taskId,
        'doc_file': url,
        'comment': comment,
      };
}
