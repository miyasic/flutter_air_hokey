import 'package:model/game_state/game_state.dart';

enum GameStartStatus {
  beforeStart,
  atStart,
  afterStart,
  atReset;

  bool get isBeforeStart => this == GameStartStatus.beforeStart;
  bool get isAtStart => this == GameStartStatus.atStart;
  bool get isAfterStart => this == GameStartStatus.afterStart;

  static GameStartStatus fromGameState(
      GameState? localGameState, GameState remoteGameState) {
    return switch ((
      localIsNull: localGameState?.ballState == null,
      remoteIsNull: remoteGameState.ballState == null
    )) {
      (localIsNull: true, remoteIsNull: true) => GameStartStatus.beforeStart,
      (localIsNull: false, remoteIsNull: false) => GameStartStatus.afterStart,
      (localIsNull: true, remoteIsNull: false) => GameStartStatus.atStart,
      (localIsNull: false, remoteIsNull: true) => GameStartStatus.atReset,
    };
  }
}
