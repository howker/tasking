import 'package:wundertusk/data_sources/core/api_base_url_holder.dart';

class IpBasedUrlHolder implements ApiBaseUrlHolder {
  /// {{http}}://111.222.333.444:0000/v1/accounts/registration
  final String protocol;

  /// http://{{111.222.333.444}}:5555/v1/accounts/registration
  final String ip;

  /// http://111.222.333.444:{{5555}}/v1/accounts/registration
  final String port;

  /// http://111.222.333.444:5555/{{v1}}/accounts/registration
  final String versioning;

  /// Самая последняя неизменяемая часть URL
  ///
  /// http://111.222.333.444:5555/v1/{{accounts/registration}}/xxx
  final String? slug;

  @override
  String get apiBaseUrl => '$protocol://$authority/$unencodedPath';

  String get authority => '$ip:$port';

  String get unencodedPath => '$versioning/${slug ?? ''}';

  IpBasedUrlHolder({
    required this.protocol,
    required this.ip,
    required this.port,
    required this.versioning,
    this.slug,
  })  : assert(!protocol.endsWith('://')),
        assert(!port.endsWith('/')),
        assert(!versioning.endsWith('/')),
        assert(
          !(slug == null || slug.startsWith('/')),
          'Value of "slug" parameter should not starts with "/"',
        ),
        assert(
          !(slug == null || slug.endsWith('/')),
          'Value of "slug" parameter should not ends with "/"',
        );
}
