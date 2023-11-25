import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game/repository/web_socket_repository.dart';

class OverlayWidget extends ConsumerWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webSocketRepository = ref.watch(webSocketRepositoryProvider);
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.black.withOpacity(0.5),
        child: ElevatedButton(
          onPressed: () {
            // webSocketRepository.message();
          },
          child: Text(
            'Hello world',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
