import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/comment/comment_remote_data_source.dart';
import 'package:wundertusk/models/comments_list.dart';
import 'package:wundertusk/services/messages/console_messages.dart';

class CommentRemoteDataSourceImpl extends CommentRemoteDataSource {
  CommentRemoteDataSourceImpl() : super(slug: 'tasks/task');

  @override
  Future<CommentsList> getCommentsList({
    required int taskId,
  }) async {
    final url = Uri.parse('$apiBaseUrl/$taskId/comment/');
    final response = await http.get(url);

    // TODO(someone): т.к. на бэке неисправленный баг, приходит ответ с бэка некорректный, как поправят, нужно обработать ответ с бэка
    if (response.statusCode == 200) {
      return CommentsList.fromResponse(response);
    } else {
      ConsoleMessages.showErrorMessage(
        'Не удалось получить список комменариев\n'
        'statusCode: ${response.statusCode}\ntaskId: $taskId',
      );
      throw Exception(response.body);
    }
  }
}
