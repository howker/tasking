import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/remote/tag/tag_remote_data_source.dart';
import 'package:wundertusk/models/tag.dart';
import 'package:wundertusk/models/tags_list.dart';
import 'package:wundertusk/repository/tags/tags_repository.dart';

class TagsRepositoryImpl implements TagsRepository {
  final TagRemoteDataSource _tagsRemoteDs;
  final TokenLocalDataSource _tokenLocalDs;

  TagsRepositoryImpl(
    this._tagsRemoteDs,
    this._tokenLocalDs,
  );

  @override
  Future<Tag> createTag({
    required String name,
  }) async {
    final token = await _tokenLocalDs.readToken();
    final tag = await _tagsRemoteDs.createTag(
      name: name,
      tokenString: token!.asJwtToken,
    );
    return tag;
  }

  @override
  Future<TagsList> getTagsList() async {
    final token = await _tokenLocalDs.readToken();
    final tagsList = await _tagsRemoteDs.getTagsList(
      tokenString: token!.asJwtToken,
    );
    return tagsList;
  }

  @override
  Future<bool> deleteTagById(int id) async {
    final token = await _tokenLocalDs.readToken();
    final isSuccess = await _tagsRemoteDs.deleteTagById(
      id: id,
      tokenString: token!.asJwtToken,
    );
    return isSuccess;
  }
}
