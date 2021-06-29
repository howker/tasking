import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/task_image/task_image_remote_data_source.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/models/task_images_list.dart';

class TaskImageRemoteDataSourceImpl extends TaskImageRemoteDataSource {
  TaskImageRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<TaskImagesList> getTaskImagesList({
    required int taskId,
    required String tokenString,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/image/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': tokenString,
      },
    );
    if (response.statusCode == 200) {
      return TaskImagesList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<TaskImage?> saveImageToTask({
    required int taskId,
    required String imagePath,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/image/');
    final request = http.MultipartRequest('POST', url)
      ..files.add(
        await http.MultipartFile.fromPath('image_file', imagePath),
      );
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      return TaskImage.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> deleteImageFromTask({
    required int imageId,
    required int taskId,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/image/$imageId/');
    final response = await http.delete(url);
    if (response.statusCode == 204) return true;
    return false;
  }
}
