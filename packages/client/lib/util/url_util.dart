import 'package:air_hokey_client/constants/constants.dart';

class UrlUtil {
  UrlUtil({required this.isDebug});
  final bool isDebug;

  Uri get webSocketUrl => isDebug
      ? Uri.parse("$kWebSocketScheme$kLocalDomain$kWebSocketPath")
      : Uri.parse("$kWebSocketSecureScheme$kRemoteDomain$kWebSocketPath");

  Uri get matchUrl => isDebug
      ? Uri.parse("$kHttpScheme$kLocalDomain$kMatchPath")
      : Uri.parse("$kHttpsScheme$kRemoteDomain$kMatchPath");
}
