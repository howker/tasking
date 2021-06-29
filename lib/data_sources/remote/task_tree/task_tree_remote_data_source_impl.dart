import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/task_tree/task_tree_remote_data_source.dart';

class TaskTreeRemoteDataSourceImpl extends TaskTreeRemoteDataSource {
  TaskTreeRemoteDataSourceImpl() : super(slug: 'tasks/tasktree');

  @override
  Future<void> getData() async {
    final url = Uri.parse(apiBaseUrl);
    await http.get(url);
  }

  @override
  Future<void> getDataById({
    required int id,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id');
    await http.get(url);
  }
}
