import 'package:http/http.dart' as http;

import 'package:wundertusk/data_sources/remote/authentication/authentication_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/token/token_remote_data_source.dart';
import 'package:wundertusk/models/token.dart';

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final TokenRemoteDataSource _tokenRemoteDs;

  AuthenticationRemoteDataSourceImpl(
    this._tokenRemoteDs,
  ) : super(slug: 'authentication/token');

  @override
  Future<Token?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$apiBaseUrl/obtaining/');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return Token.decode(response.body);
    } else if (response.statusCode == 401) {
      return _tokenRemoteDs.refreshToken();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
