import 'package:wundertusk/models/token.dart';

abstract class TokenLocalDataSource {
  Future<void> deleteToken();

  Future<Token?> readToken();

  Future<void> saveToken(Token token);
}
