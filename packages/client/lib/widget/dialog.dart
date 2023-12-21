import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ExitRoomDialog extends StatelessWidget {
  const ExitRoomDialog({Key? key, required this.onTapYes}) : super(key: key);
  final void Function() onTapYes;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ゲーム終了'),
      content: const Text('対戦相手が退出しました。ルームを退出します。'),
      actions: [
        TextButton(
          onPressed: () async {
            await AutoRouter.of(context).pop();
            onTapYes();
          },
          child: const Text('はい'),
        ),
      ],
    );
  }
}
