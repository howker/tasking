import 'dart:convert';

import 'package:http/http.dart' as http;

/// Image object, which can be attached to task
class TaskImage {
  /// Id of current image
  final int id;

  /// Id of task
  final int taskId;

  /// Url to image on server
  final String url;
  String? comment;

  TaskImage({
    required this.id,
    required this.taskId,
    required this.url,
    this.comment,
  });

  factory TaskImage.fromJson(Map<String, dynamic> json) => TaskImage(
        id: json['id'] as int,
        taskId: json['task'] as int,
        url: json['image_file'] as String,
        comment: json['comment'] as String?,
      );

  factory TaskImage.fromResponse(http.Response response) => TaskImage.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'task': taskId,
        'image_file': url,
        'comment': comment,
      };
}
