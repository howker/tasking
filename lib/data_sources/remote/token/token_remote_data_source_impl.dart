import 'package:http/http.dart' as http;
import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';

import 'package:wundertusk/data_sources/remote/token/token_remote_data_source.dart';
import 'package:wundertusk/models/token.dart';

class TokenRemoteDataSourceImpl extends TokenRemoteDataSource {
  final TokenLocalDataSource _tokenLocalDs;

  TokenRemoteDataSourceImpl(
    this._tokenLocalDs,
  ) : super(slug: 'authentication/token');

  @override
  Future<Token> obtainToken({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$apiBaseUrl/obtaining/');
    final body = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final token = Token.decode(response.body);
      await _tokenLocalDs.saveToken(token);
      return token;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Token> refreshToken() async {
    final url = Uri.parse('$apiBaseUrl/token/refreshing/');
    final possibleOldToken = await _tokenLocalDs.readToken();
    final response = await http.post(
      url,
      body: {
        'token': possibleOldToken?.value,
      },
    );

    if (response.statusCode == 200) {
      final newToken = Token.decode(response.body);
      await _tokenLocalDs.saveToken(newToken);
      return newToken;
    }

    throw Exception(response.reasonPhrase);
  }

  @override
  Future<Token> verifyToken() {
    // TODO(someone): implement verifyToken
    throw UnimplementedError();
  }
}
