import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/executor.dart';
import 'package:wundertusk/models/executors_list.dart';

abstract class ExecutorsRemoteDataSource extends RemoteDataSource {
  ExecutorsRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<bool> addTaskExecutor({
    required int taskId,
    required int userId,
    required String tokenString,
  });

  Future<ExecutorsList> getTaskExecutorsList({
    required int taskId,
    required String tokenString,
  });

  Future<Executor> getTaskExecutor({
    required int taskId,
    required int executorId,
    required String tokenString,
  });

  Future<bool> deleteTaskExecutor({
    required int taskId,
    required int executorId,
    required String tokenString,
  });
}
