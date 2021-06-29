import 'package:flutter/material.dart';

import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/repository/tags/tags_repository.dart';

enum TagsSettingsScreenStates {
  defaultState,
  addState,
  selectionState,
}

class TagsSettingsScreenProvider extends ChangeNotifier {
  final TagsRepository _tagsRepo;
  final List<Tag> _selectedTags = List<Tag>.empty(growable: true);

  TagsSettingsScreenStates get screenState => _screenState;

  String? get newTagName => _newTagName;

  List<Tag> get selectedTags => _selectedTags;

  TagsSettingsScreenStates _screenState = TagsSettingsScreenStates.defaultState;

  String? _newTagName;

  TagsSettingsScreenProvider(this._tagsRepo);

  void changeState(TagsSettingsScreenStates state) {
    if (state == TagsSettingsScreenStates.defaultState &&
        _selectedTags.isNotEmpty) {
      _selectedTags.clear();
    }
    _screenState = state;
    notifyListeners();
  }

  void setNewTagName(String? value) {
    _newTagName = value;
    notifyListeners();
  }

  Future<void> saveNewTag() async {
    if (_newTagName != null && _newTagName!.isNotEmpty) {
      await _tagsRepo.createTag(name: _newTagName!);
    }
  }

  void addToOrDeleteFromSelected(Tag tag) {
    if (_selectedTags.contains(tag)) {
      _selectedTags.remove(tag);
    } else {
      _selectedTags.add(tag);
    }
    notifyListeners();
  }

  void addTagToSelected(Tag tag) {
    if (_selectedTags.contains(tag)) return;
    _selectedTags.add(tag);
    notifyListeners();
  }

  void removeTagFromSelected(Tag tag) {
    if (!_selectedTags.contains(tag)) return;
    _selectedTags.remove(tag);
    notifyListeners();
  }

  Future<void> deleteSelectedTags() async {
    for (final tag in _selectedTags) {
      await _tagsRepo.deleteTagById(tag.id);
    }
    changeState(TagsSettingsScreenStates.defaultState);
  }
}
