import 'dart:convert';

import 'package:air_hokey_client/constants/constants.dart';
import 'package:model/client_game_state/client_game_state.dart';
import 'package:model/request/client_request.dart';
import 'package:model/reset/reset.dart';
import 'package:model/start/start.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRepository {
  WebSocketRepository({required this.isDebug}) {
    final url = isDebug ? kLocalUrl : kRemoteUrl;
    channel = WebSocketChannel.connect(Uri.parse(url));
  }
  final bool isDebug;
  late final WebSocketChannel channel;
  // final channel = WebSocketChannel.connect(
  //     Uri.parse('wss://gamesample-ibiwnvw3aa-an.a.run.app/ws'));

  Stream<dynamic> getChannel() {
    return channel.stream;
  }

  void sendClientGameState(ClientGameState clientGameState) {
    final request = ClientRequest(
      type: ClientRequestType.clientGameState,
      requestDetail: clientGameState,
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
