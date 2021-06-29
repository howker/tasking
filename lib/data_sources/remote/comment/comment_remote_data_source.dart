import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/comments_list.dart';

abstract class CommentRemoteDataSource extends RemoteDataSource {
  CommentRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<CommentsList> getCommentsList({
    required int taskId,
  });
}
