import 'package:air_hokey_client/provider/is_debug_proivder.dart';
import 'package:air_hokey_client/util/url_util.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final roomRepositoryProvider = Provider(
  (ref) => RoomRepository(
    isDebug: ref.watch(isDebugProvider),
  ),
);

class RoomRepository {
  RoomRepository({required this.isDebug}) {
    urlUtil = UrlUtil(isDebug: isDebug);
  }
  final Dio dio = Dio(); // Dioクライアントのインスタンスを作成
  final bool isDebug;
  late final UrlUtil urlUtil;

  // remoteMatchUrlにアクセスしてルームIDを取得
  Future<String?> getRoomId() async {
    try {
      final response =
          await dio.get(urlUtil.matchUrl.toString()); // GETリクエストを送信
      if (response.statusCode == 200) {
        return response.data.toString(); // レスポンスのbodyを返す
      }
      return null; // ステータスコードが200以外の場合はnullを返す
    } catch (e) {
      // エラーハンドリング
      return null;
    }
  }
}
