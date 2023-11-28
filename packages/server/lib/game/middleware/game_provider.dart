import 'package:air_hokey_server/game/cubit/game_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

final _game = GameCubit();

// Provide the game instance via `RequestContext`.
final gameProvider = provider<GameCubit>((_) => _game);
