import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/models/task_images_list.dart';

abstract class TaskImageRemoteDataSource extends RemoteDataSource {
  TaskImageRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<TaskImagesList> getTaskImagesList({
    required int taskId,
    required String tokenString,
  });

  Future<TaskImage?> saveImageToTask({
    required int taskId,
    required String imagePath,
  });

  Future<bool> deleteImageFromTask({
    required int taskId,
    required int imageId,
  });
}
