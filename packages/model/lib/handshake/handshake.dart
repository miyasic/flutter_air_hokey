import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/game_state/game_state.dart';

part 'handshake.freezed.dart';
part 'handshake.g.dart';

@freezed

/// 初回接続時のレスポンスクラス
class Handshake with _$Handshake {
  /// コンストラクタ
  const factory Handshake({
    /// ユーザーのID
    required String id,

    /// ユーザーのタイプ
    required UserRole userRole,

    /// ゲームの状態
    required GameState gameState,
  }) = _Handshake;
  const Handshake._();

  /// JSONからインスタンスを生成する
  factory Handshake.fromJson(Map<String, dynamic> json) =>
      _$HandshakeFromJson(json);
}

/// ユーザーのタイプ
enum UserRole {
  /// 部屋を作成した人
  roomCreator,

  /// 挑戦者
  challenger,

  /// 観戦者
  spectator
}

extension UserRoleExtension on UserRole {
  bool get isRoomCreator => this == UserRole.roomCreator;
  bool get isChallenger => this == UserRole.challenger;
  bool get isSpectator => this == UserRole.spectator;
}
