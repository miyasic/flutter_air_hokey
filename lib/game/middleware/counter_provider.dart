import 'package:air_hokey/game/cubit/game_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

final _counter = GameCubit();

// Provide the game instance via `RequestContext`.
final counterProvider = provider<GameCubit>((_) => _counter);
