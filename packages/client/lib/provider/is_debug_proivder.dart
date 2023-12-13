import 'package:hooks_riverpod/hooks_riverpod.dart';

final isDebugProvider = Provider<bool>((ref) {
  const bool isDebug = String.fromEnvironment('isDebug') == 'true';
  return isDebug;
});
