import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
        (channel, protocol) {
      // A new client has connected to our server.
      print('connected');

      // Send a message to the client.
      channel.sink.add('hello from the server');

      // Listen for messages from the client.
      channel.stream.listen(
        print,
        // The client has disconnected.
        onDone: () => print('disconnected'),
      );
    },
  );

  return handler(context);
}