import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/task_tag/task_tag_remote_data_source.dart';
import 'package:wundertusk/models/task/task.dart';

class TaskTagRemoteDataSourceImpl extends TaskTagRemoteDataSource {
  TaskTagRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<Task> addTagsToTask({
    required int taskId,
    required List<String> tagNames,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/add-tags/');
    final body = <String, dynamic>{
      'tags': tagNames,
    };
    final response = await http.post(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': tokenString,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return Task.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Task> deleteTagsFromTask({
    required int taskId,
    required List<String> tagNames,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/del-tags');
    final body = {
      'tags': tagNames,
    };
    final response = await http.delete(
      url,
      headers: {
        'Authorization': tokenString,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return Task.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }
}
