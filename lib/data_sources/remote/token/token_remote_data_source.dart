import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/token.dart';

abstract class TokenRemoteDataSource extends RemoteDataSource {
  TokenRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<Token> obtainToken({
    required String email,
    required String password,
  });

  Future<Token> refreshToken();

  Future<Token> verifyToken();
}
