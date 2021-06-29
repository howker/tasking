import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/models/tags_list.dart';

abstract class TagsRepository {
  Future<Tag> createTag({
    required String name,
  });

  Future<TagsList> getTagsList();

  Future<bool> deleteTagById(int id);
}
