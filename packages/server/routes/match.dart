import 'dart:math';
import 'package:air_hokey_server/game/cubit/game_cubit.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final cubitMap = context.read<Map<String, GameCubit>>();
  final keys = cubitMap.keys.toList();
  if (keys.isEmpty) {
    return Response(body: '', statusCode: 404); // Roomが見つからない場合のエラーレスポンス
  }
  final random = Random();
  final id = keys[random.nextInt(keys.length)]; // ランダムにIDを選択
  return Response(body: id, statusCode: 200);
}
