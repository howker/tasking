import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';

abstract class TaskTreeRemoteDataSource extends RemoteDataSource {
  TaskTreeRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<void> getData();

  Future<void> getDataById({
    required int id,
  });
}
