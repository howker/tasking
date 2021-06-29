import 'package:wundertusk/data_sources/core/ip_based_url_holder.dart';

class RemoteDataSource extends IpBasedUrlHolder {
  RemoteDataSource({
    String? slug,
  }) : super(
          protocol: 'http',
          ip: '178.154.203.204',
          port: '9007',
          versioning: 'v1',
          slug: slug,
        );
}
