import 'package:air_hokey_server/game/game.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;

Handler middleware(Handler handler) {
  return handler.use(gameProvider).use(
        fromShelfMiddleware(
          shelf.corsHeaders(
            headers: {
              shelf.ACCESS_CONTROL_ALLOW_ORIGIN:
                  '*', // Todo: 本番環境では許可するドメインを指定する
            },
          ),
        ),
      );
}
