import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/tag/tag_remote_data_source.dart';
import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/models/tags_list.dart';

class TagRemoteDataSourceImpl extends TagRemoteDataSource {
  TagRemoteDataSourceImpl() : super(slug: 'tasks/tags');

  @override
  Future<TagsList> getTagsList({
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return TagsList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Tag> createTag({
    required String name,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/');
    final body = {
      'name': name,
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
      return Tag.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Tag> getTagById({
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
      return Tag.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Tag> changeTagById({
    required int id,
    required String name,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id/');
    final body = {
      'name': name,
    };
    final response = await http.put(
      url,
      headers: {
        'Authorization': tokenString,
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return Tag.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Tag> changeTagFieldById({
    required int id,
    required String name,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$id/');
    final body = {
      'name': name,
    };
    final response = await http.patch(
      url,
      headers: {
        'Authorization': tokenString,
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return Tag.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> deleteTagById({
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
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
