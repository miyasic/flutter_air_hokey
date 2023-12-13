import 'dart:math';
import 'package:air_hokey_server/game/cubit/game_cubit.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:uuid/v4.dart';

Response onRequest(RequestContext context) {
  final cubitMap = context.read<Map<String, GameCubit>>();
  final availableRoom = getAvailableRoom(cubitMap);

  final room = chooseRoom(availableRoom);
  if (room == null) {
    final newRoom = createNewRoom(cubitMap.keys.toList());
    cubitMap[newRoom.key] = newRoom.value;
    return Response(body: newRoom.key, statusCode: 200);
  }
  return Response(body: room.key, statusCode: 200);
}

// 新しいRoomを作成
MapEntry<String, GameCubit> createNewRoom(List keys) {
  final id = const UuidV4().generate().substring(0, 8);
  if (keys.contains(id)) {
    return createNewRoom(keys);
  }
  final cubit = GameCubit(gameId: id);
  return MapEntry(id, cubit);
}

// 既存のRoomのうち、空きがあるものを返す
Map<String, GameCubit> getAvailableRoom(Map<String, GameCubit> cubitMap) {
  final availableRoom =
      cubitMap.entries.where((element) => element.value.state.ids.length == 1);
  return {for (var entry in availableRoom) entry.key: entry.value};
}

MapEntry<String, GameCubit>? chooseRoom(Map<String, GameCubit> availableRooms) {
  final n = availableRooms.length;
  final random = Random().nextInt(n + 1);

  // 1/(n+1) の確率で新しい部屋を作成
  if (random == n) {
    return null;
  } else {
    // n/(n+1) の確率で既存の部屋を選択
    List<MapEntry<String, GameCubit>> rooms = availableRooms.entries.toList();
    return rooms[random];
  }
}
