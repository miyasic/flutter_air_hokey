import 'package:air_hokey/game/game.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) => handler.use(gameProvider);
