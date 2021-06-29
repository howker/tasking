import 'package:wundertusk/data_sources/remote/core/remote_data_source.dart';
import 'package:wundertusk/models/token.dart';

abstract class AuthenticationRemoteDataSource extends RemoteDataSource {
  AuthenticationRemoteDataSource({
    String? slug,
  }) : super(slug: slug);

  Future<Token?> login({
    required String email,
    required String password,
  });
}
