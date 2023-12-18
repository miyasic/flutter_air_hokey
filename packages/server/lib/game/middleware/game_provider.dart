import 'package:air_hokey_server/game/cubit/game_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

final Map<String, GameCubit> _game = {};

// Provide the client instance via `RequestContext`.
final gameProvider = provider<Map<String, GameCubit>>((_) => _game);
