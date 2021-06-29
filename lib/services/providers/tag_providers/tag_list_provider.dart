import 'package:flutter/material.dart';

import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/models/tags_list.dart';
import 'package:wundertusk/repository/tags/tags_repository.dart';

class TagListProvider extends ChangeNotifier {
  final TagsRepository _tagsRepo;

  List<Tag> get tags => _tags;

  List<Tag> _tags = List<Tag>.empty(growable: true);

  TagListProvider(this._tagsRepo) {
    fetchTags();
  }

  Future<TagsList> getTagsList() async => _tagsRepo.getTagsList();

  Future<void> fetchTags() async {
    final tagsList = await _tagsRepo.getTagsList();
    _tags = tagsList.results;
    notifyListeners();
  }

  // TODO(someone): это отсюда удалить, этот провайдер не для создания тэгов
  Future<void> createTag({
    required String name,
  }) async {
    final tag = await _tagsRepo.createTag(name: name);
    tags.add(tag);
    notifyListeners();
  }
}
