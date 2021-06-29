import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/models/token.dart';

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> deleteToken() => _storage.delete(key: 'token');

  @override
  Future<Token?> readToken() async {
    final tokenJsonString = await _storage.read(key: 'token');
    if (tokenJsonString != null) {
      return Token.decode(tokenJsonString);
    }
  }

  @override
  Future<void> saveToken(Token token) async {
    final tokenJsonString = token.encode();
    await _storage.write(key: 'token', value: tokenJsonString);
  }
}
