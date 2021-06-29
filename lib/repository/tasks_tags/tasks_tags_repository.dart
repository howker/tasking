abstract class TasksTagsRepository {
  Future<void> addTagsToTask({
    required int id,
    required List<String> tags,
  });

  Future<void> deleteTagsFromTask({
    required int id,
    required List<String> tags,
  });
}
