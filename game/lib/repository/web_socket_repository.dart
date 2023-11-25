import 'dart:convert';

import 'package:air_hokey/game/request/client_request.dart';
import 'package:riverpod/riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRepository {
  WebSocketRepository();
  final channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws'));
  // final channel = WebSocketChannel.connect(
  //     Uri.parse('wss://gamesample-ibiwnvw3aa-an.a.run.app/ws'));

  Stream<dynamic> getChannel() {
    return channel.stream;
  }

  void message(ClientRequest request) {
    final message = jsonEncode(request.toJson((e) => e.toJson()));
    channel.sink.add(message);
  }
}
