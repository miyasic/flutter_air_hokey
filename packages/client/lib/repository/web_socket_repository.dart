import 'dart:convert';
import 'dart:math';
import 'package:air_hokey_client/util/url_util.dart';
import 'package:model/client_declaration/client_declaration.dart';

import 'package:model/request/client_request.dart';
import 'package:model/reset/reset.dart';
import 'package:model/start/start.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRepository {
  WebSocketRepository({required this.isDebug}) {
    final urlUtil = UrlUtil(isDebug: isDebug);
    final id = (1 + Random().nextInt(5)).toString();
    final url = urlUtil.webSocketUrl;
    channel = WebSocketChannel.connect(Uri.parse("$url/$id"));
  }
  final bool isDebug;
  late final WebSocketChannel channel;

  Stream<dynamic> getChannel() {
    return channel.stream;
  }

  void sendClientDeclaration(ClientDeclaration clientDeclaration) {
    final request = ClientRequest(
      type: ClientRequestType.clientDeclaration,
      requestDetail: clientDeclaration,
    );
    _message(request);
  }

  void sendReset(Reset reset) {
    final request = ClientRequest(
      type: ClientRequestType.reset,
      requestDetail: reset,
    );
    _message(request);
  }

  void sendStart(Start start) {
    final request = ClientRequest(
      type: ClientRequestType.start,
      requestDetail: start,
    );
    _message(request);
  }

  void _message(ClientRequest request) {
    final message = jsonEncode(request.toJson((e) => e.toJson()));
    channel.sink.add(message);
  }

  void close() {
    channel.sink.close();
  }
}
