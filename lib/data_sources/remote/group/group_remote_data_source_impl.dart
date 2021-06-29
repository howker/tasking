import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/group/group_remote_data_source.dart';
import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/models/groups_list.dart';
import 'package:wundertusk/models/task/task.dart';

class GroupRemoteDataSourceImpl extends GroupRemoteDataSource {
  GroupRemoteDataSourceImpl() : super(slug: 'tasks/groups');

  @override
  Future<GroupsList> getGroupsList({
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return GroupsList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Group> createGroup({
    required String name,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final body = {
      'group_name': name,
    };
    final response = await http.post(
      url,
      headers: {
        'Authorization': tokenString,
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    if (response.statusCode == 201) {
      return Group.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<List<Task>> getGroupTasksList({
    required String tokenString,
    required int groupId,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$groupId/tasks-list/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      final tasks = list
          .map((dynamic jsonTask) =>
              Task.fromJson(jsonTask as Map<String, dynamic>))
          .toList();

      return tasks;
    } else {
      throw Exception(response.body);
    }
  }
}
