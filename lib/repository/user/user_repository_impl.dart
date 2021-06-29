import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/remote/accounts/accounts_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/authentication/authentication_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/token/token_remote_data_source.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/models/users_list.dart';
import 'package:wundertusk/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final AccountsRemoteDataSource _accountsRemoteDs;
  final AuthenticationRemoteDataSource _authRemoteDs;
  final TokenLocalDataSource _tokenLocalDs;
  final TokenRemoteDataSource _tokenRemoteDs;

  UserRepositoryImpl(
    this._accountsRemoteDs,
    this._authRemoteDs,
    this._tokenLocalDs,
    this._tokenRemoteDs,
  );

  @override
  Future<User?> registerUser({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final registeredUser = await _accountsRemoteDs.registerUser(
        email: email,
        password: password,
        fullName: fullName,
      );
      final usersToken = await _tokenRemoteDs.obtainToken(
        email: email,
        password: password,
      );
      await _tokenLocalDs.saveToken(usersToken);
      ConsoleMessages.showSuccessMessage('Registration Success');
      return registeredUser;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
    }
  }

  @override
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _authRemoteDs.login(
        email: email,
        password: password,
      );

      if (token == null) {
        ConsoleMessages.showErrorMessage('Login Failed');
        return false;
      }

      await _tokenLocalDs.saveToken(token);

      ConsoleMessages.showSuccessMessage('Login Success');
      return true;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
      return false;
    }
  }

  @override
  Future<String?> sendEmail({
    required String email,
  }) async {
    try {
      var checkSecretResult = false;
      final secret = await _accountsRemoteDs.sendEmail(email: email);

      if (secret == null) {
        ConsoleMessages.showErrorMessage('Send email Failed');
        return secret;
      } else {
        checkSecretResult = await _accountsRemoteDs.checkSecret(secret: secret);
      }
      if (checkSecretResult) {
        return secret;
      }
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
      return null;
    }
  }

  @override
  Future<bool> sendNewPassword({
    required String secret,
    required String password,
  }) async {
    try {
      final result = await _accountsRemoteDs.sendNewPassword(
        secret: secret,
        password: password,
      );

      return result;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
      return false;
    }
  }

  @override
  Future<UsersList> getUsersList({
    String? sourceUrl,
  }) async {
    try {
      final usersList = await _accountsRemoteDs.getUsersList(
        sourceUrl: sourceUrl,
      );
      return usersList;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
      return UsersList.empty();
    }
  }

  @override
  Future<User?> getUserById(int id) async {
    try {
      final user = await _accountsRemoteDs.getUserById(id);
      return user;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
    }
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      final maybeUser = await _accountsRemoteDs.getUserByEmail(email);
      return maybeUser;
    } on Exception catch (e) {
      ConsoleMessages.showErrorMessage(e);
    }
  }
}
