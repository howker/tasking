import 'package:wundertusk/data_sources/remote/comment/comment_remote_data_source.dart';
import 'package:wundertusk/models/comments_list.dart';
import 'package:wundertusk/repository/comments/comments_repository.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final CommentRemoteDataSource _remoteDataSource;

  CommentsRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<CommentsList> getCommentsList({
    required int taskId,
  }) async =>
      _remoteDataSource.getCommentsList(taskId: taskId);
}
