import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/repository/user/user_repository.dart';

class TaskCreatorProvider {
  final UserRepository _userRepo;

  TaskCreatorProvider(this._userRepo);

  Future<User> getTaskCreator(Task task) async =>
      (await _userRepo.getUserById(task.creator))!;
}
