import 'package:wundertusk/models/comments_list.dart';

abstract class CommentsRepository {
  Future<CommentsList> getCommentsList({
    required int taskId,
  });
}
