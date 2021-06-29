import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/task/task_remote_data_source.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/tasks_list.dart';

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  TaskRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<Task?> changeTaskFieldsById({
    required int id,
    required String tokenString,
    String? title,
    DateTime? deadline,
    int? priority,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id/');
    final body = <String, dynamic>{};

    if (title != null) body['title'] = title;
    if (deadline != null) body['deadline'] = deadline.toIso8601String();
    if (priority != null) body['priority'] = priority;

    if (body.isEmpty) return null;

    final response = await http.patch(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );

    if (response.statusCode == 200) {
      return Task.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Task> createTask({
    required String title,
    required String deadline,
    required String tokenString,
    int? priority,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final body = <String, dynamic>{
      'title': title,
      'deadline': deadline,
    };

    if (priority != null) body['priority'] = priority;

    final response = await http.post(
      url,
      headers: {
        'Authorization': tokenString,
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 201) {
      return Task.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> deleteTask({
    required int id,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id/');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    return response.statusCode == 204;
  }

  // TODO(someone): implement filtering, http://178.154.203.204:9007/v1/openapi/#/Tasks/GetListMyTasks
  @override
  Future<TasksList> getCurrentUserTasks({
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/my/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return TasksList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Task> getTaskById({
    required int id,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return Task.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<TasksList> getTasksList({
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );

    if (response.statusCode == 200) {
      return TasksList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<TasksList> getFilteredTasksList({
    required Map<String, dynamic> queryParameters,
    required String tokenString,
  }) async {
    final url = Uri.http(authority, '$unencodedPath/', queryParameters);
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );

    if (response.statusCode == 200) {
      return TasksList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }
}
