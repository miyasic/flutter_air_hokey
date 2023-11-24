import 'package:riverpod/riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketRepositoryProvider =
    Provider<WebSocketRepository>((_) => WebSocketRepository());

class WebSocketRepository {
  WebSocketRepository();
  // final channel = WebSocketChannel.connect(Uri.parse('ws://100.64.1.40:8080/ws'));
  final channel = WebSocketChannel.connect(
      Uri.parse('wss://gamesample-ibiwnvw3aa-an.a.run.app/ws'));

  Stream<dynamic> getChannel() {
    return channel.stream;
  }
}
