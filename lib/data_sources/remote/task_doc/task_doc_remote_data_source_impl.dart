import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/task_doc/task_doc_remote_data_source.dart';
import 'package:wundertusk/models/task_doc.dart';
import 'package:wundertusk/models/task_docs_list.dart';

class TaskDocRemoteDataSourceImpl extends TaskDocRemoteDataSource {
  TaskDocRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<TaskDocsList> getTaskDocsList({
    required int taskId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/doc/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return TaskDocsList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<TaskDoc?> saveDocToTask({
    required int taskId,
    required String docPath,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/doc/');
    final request = http.MultipartRequest('POST', url)
      ..headers.addAll(
        <String, String>{
          'Authorization': tokenString,
        },
      )
      ..files.add(
        await http.MultipartFile.fromPath('doc_file', docPath),
      );
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      return TaskDoc.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> deleteDocFromTask({
    required int taskId,
    required int docId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/doc/$docId/');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 204) return true;
    return false;
  }
}
