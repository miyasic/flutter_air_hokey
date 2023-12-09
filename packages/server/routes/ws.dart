import 'dart:convert';

import 'package:air_hokey_server/game/game.dart';
import 'package:model/client_game_state/client_declaration.dart';
import 'package:model/handshake/handshake.dart';
import 'package:model/request/client_request.dart';
import 'package:model/reset/reset.dart';
import 'package:model/response/server_response.dart';
import 'package:model/start/start.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:uuid/v4.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      final cubit = context.read<GameCubit>()..subscribe(channel);
      final uuid = const UuidV4().generate();
      final userRole = cubit.onNewAccess(uuid);
      final handshake =
          Handshake(id: uuid, userRole: userRole, gameState: cubit.state);
      final serverResponse = ServerResponse(
        type: ServerResponseType.handshake,
        responseDetail: handshake,
      );
      channel.sink.add(
        jsonEncode(
          serverResponse.toJson(
            (handshake) => handshake.toJson(),
          ),
        ),
      );

      channel.stream.listen(
        (event) {
          if (event is String) {
            final json = jsonDecode(event);
            final type = ClientRequestType.fromString(json['type']);
            final requestDetail = json['requestDetail'];
            switch (type) {
              case ClientRequestType.clientDeclaration:
                cubit.updateState(
                  ClientDeclaration.fromJson(
                    requestDetail,
                  ),
                );
              case ClientRequestType.reset:
                cubit.reset(
                  Reset.fromJson(
                    requestDetail,
                  ),
                );
              case ClientRequestType.start:
                cubit.start(
                  Start.fromJson(
                    requestDetail,
                  ),
                );
            }
          }
        },
        onDone: () => cubit.unsubscribe(channel),
      );
    },
  );

  return handler(context);
}
