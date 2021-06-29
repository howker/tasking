import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/accounts/accounts_remote_data_source.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/models/users_list.dart';
import 'package:wundertusk/services/messages/console_messages.dart';

class AccountsRemoteDataSourceImpl extends AccountsRemoteDataSource {
  AccountsRemoteDataSourceImpl() : super(slug: 'accounts');

  @override
  Future<User> registerUser({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final url = Uri.parse('$apiBaseUrl/registration/');
    final body = <String, dynamic>{
      'email': email,
      'password': password,
      'full_name': fullName,
    };

    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      return User.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<UsersList> getUsersList({
    String? sourceUrl,
  }) async {
    final url = Uri.parse(sourceUrl ?? '$apiBaseUrl/user/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return UsersList.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<String?> sendEmail({
    required String email,
  }) async {
    final url = Uri.parse('$apiBaseUrl/sendemail/');
    final body = <String, dynamic>{
      'email': email,
    };
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;

      return result['secret'] as String;
    } else {
      ConsoleMessages.showErrorMessage('Email $email в базе отсутствует');
      throw Exception(response.body);
    }
  }

  @override
  Future<bool> checkSecret({required String secret}) async {
    final url = Uri.parse('$apiBaseUrl/newpassword/$secret/');

    //TODO так как в response не приходит statusCode вообще, то нужно как только
    //исправят это на бэкенде, раскомментировать код ниже:

    // final response = await http.get(url);
    // if (response.statusCode == 302) {
    //   return true;
    // } else {
    //   ConsoleMessages.showErrorMessage(
    //     'Ошибка проверки, код = ${response.statusCode}',
    //   );
    //   return false;
    // }

    return true; // а также удалить эту строку
  }

  @override
  Future<bool> sendNewPassword({
    required String secret,
    required String password,
  }) async {
    final url = Uri.parse('$apiBaseUrl/newpassword/$secret/');
    final body = <String, dynamic>{
      'password': password,
    };
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User> getUserById(int id) async {
    final url = Uri.parse('$apiBaseUrl/user/$id/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return User.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<User> getUserByEmail(String email) async {
    final url = Uri.http(
      authority,
      '/$unencodedPath/user/get-user/',
      <String, dynamic>{
        'email': email,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return User.fromResponse(response);
    } else {
      throw Exception(response.body);
    }
  }
}
