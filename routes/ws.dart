import 'dart:convert';

import 'package:air_hokey/game/cubit/game_cubit.dart';
import 'package:air_hokey/game/handshake/handshake.dart';
import 'package:air_hokey/game/response/server_response.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:uuid/v4.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      // A new client has connected to our server.
      // Subscribe the new client to receive notifications
      // whenever the cubit state changes.
      final cubit = context.read<GameCubit>()..subscribe(channel);

      final uuid = const UuidV4().generate();
      final userRole = cubit.onNewAccess(uuid);
      final handshake =
          Handshake(id: uuid, userRole: userRole, gameState: cubit.state);
      // Send the current count to the new client.
      final serverResponse = ServerResponse(
          type: ServerResponseType.handshake, responseDetail: handshake);
      channel.sink.add(jsonEncode(serverResponse.toJson(
        (handshake) => handshake.toJson(),
      )));

      // Listen for messages from the client.
      channel.stream.listen(
        (event) {
          switch (event) {
            // Handle an increment message.
            case '__increment__':
              cubit.increment();
              break;
            // Handle a decrement message.
            case '__decrement__':
              cubit.decrement();
              break;
            // Ignore any other messages.
            default:
              print("test $event");
              break;
          }
        },
        // The client has disconnected.
        // Unsubscribe the channel.
        onDone: () => cubit.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
