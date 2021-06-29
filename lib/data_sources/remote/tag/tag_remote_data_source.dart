import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/models/tags_list.dart';

abstract class TagRemoteDataSource extends RemoteDataSource {
  TagRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<TagsList> getTagsList({
    required String tokenString,
  });

  Future<Tag> createTag({
    required String name,
    required String tokenString,
  });

  Future<Tag> getTagById({
    required int id,
    required String tokenString,
  });

  Future<Tag> changeTagById({
    required int id,
    required String name,
    required String tokenString,
  });

  Future<Tag> changeTagFieldById({
    required int id,
    required String name,
    required String tokenString,
  });

  Future<bool> deleteTagById({
    required int id,
    required String tokenString,
  });
}
