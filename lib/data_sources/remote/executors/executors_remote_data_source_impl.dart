import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/executors/executors_remote_data_source.dart';
import 'package:wundertusk/models/executor.dart';
import 'package:wundertusk/models/executors_list.dart';

class ExecutorsRemoteDataSourceImpl extends ExecutorsRemoteDataSource {
  ExecutorsRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<bool> addTaskExecutor({
    required int taskId,
    required int userId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/executors/');
    final headers = <String, String>{
      'accept': 'application/json',
      'Authorization': tokenString,
    };
    final body = <String, dynamic>{
      'executor': '$userId',
    };
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<ExecutorsList> getTaskExecutorsList({
    required int taskId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/executors/');
    final headers = <String, String>{
      'accept': 'application/json',
      'Authorization': tokenString,
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return ExecutorsList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Executor> getTaskExecutor({
    required int taskId,
    required int executorId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/executors/$executorId/');
    final headers = <String, String>{
      'accept': 'application/json',
      'Authorization': tokenString,
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return Executor.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> deleteTaskExecutor({
    required int taskId,
    required int executorId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/executors/$executorId/');
    final headers = <String, String>{
      'accept': '*/*',
      'Authorization': tokenString,
    };
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }
}
