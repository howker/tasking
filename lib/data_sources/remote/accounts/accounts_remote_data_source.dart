import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/models/users_list.dart';

abstract class AccountsRemoteDataSource extends RemoteDataSource {
  AccountsRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<User> registerUser({
    required String email,
    required String password,
    required String fullName,
  });

  Future<String?> sendEmail({
    required String email,
  });

  Future<bool> checkSecret({
    required String secret,
  });

  Future<bool> sendNewPassword({
    required String secret,
    required String password,
  });

  Future<UsersList> getUsersList({
    String? sourceUrl,
  });

  Future<User> getUserById(int id);

  Future<User> getUserByEmail(String email);
}
