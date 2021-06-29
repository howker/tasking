import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/models/users_list.dart';

abstract class UserRepository {
  Future<User?> registerUser({
    required String email,
    required String password,
    required String fullName,
  });

  Future<bool> login({
    required String email,
    required String password,
  });

  Future<String?> sendEmail({
    required String email,
  });

  Future<bool> sendNewPassword({
    required String password,
    required String secret,
  });

  /// If source url is provided, then list will be loaded from this url
  Future<UsersList> getUsersList({
    String? sourceUrl,
  });

  Future<User?> getUserById(int id);

  Future<User?> getUserByEmail(String email);
}
