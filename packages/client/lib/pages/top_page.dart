import 'package:air_hokey_client/app_router.dart';
import 'package:air_hokey_client/repository/room_repository.dart';
import 'package:air_hokey_client/util/room_id_validator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomIdController = useTextEditingController();
    final formKey =
        useMemoized(() => GlobalKey<FormState>()); // 1. Create a GlobalKey

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _RandomMatchButton(),
              const Gap(20),
              const Text(
                "or",
                style: TextStyle(fontSize: 16),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RoomIdFormField(
                    roomIdController: roomIdController,
                  ),
                  const Gap(20),
                  _EnterRoomButton(
                      roomIdController: roomIdController, formKey: formKey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RandomMatchButton extends HookConsumerWidget {
  const _RandomMatchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final String? id = await ref.watch(roomRepositoryProvider).getRoomId();
        if (context.mounted) {
          if (id != null) {
            context.router.push(HokeyRoute(id: id));
          } else {
            context.router.push(const NotFoundRoute());
          }
        }
      },
      child: const Text('Random Match'),
    );
  }
}

class _EnterRoomButton extends HookConsumerWidget {
  const _EnterRoomButton({
    Key? key,
    required this.roomIdController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController roomIdController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final String customRoomId = roomIdController.text;
          context.router.push(HokeyRoute(id: customRoomId));
        }
      },
      child: const Text('Enter Room'),
    );
  }
}

class _RoomIdFormField extends HookConsumerWidget {
  const _RoomIdFormField({required this.roomIdController, super.key});
  final TextEditingController roomIdController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        controller: roomIdController,
        decoration: const InputDecoration(
          labelText: 'Enter Room ID',
          border: OutlineInputBorder(),
        ),
        validator: RoomIdValidator.validate,
      ),
    );
  }
}
