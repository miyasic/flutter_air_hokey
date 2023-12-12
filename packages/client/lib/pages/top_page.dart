import 'package:air_hokey_client/app_router.dart';
import 'package:air_hokey_client/repository/room_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            final String? id =
                await ref.watch(roomRepositoryProvider).getRoomId();
            context.router.push(HokeyRoute(id: id ?? 'hoge'));
          },
          child: const Text('TopPage'),
        ),
      ),
    );
  }
}
