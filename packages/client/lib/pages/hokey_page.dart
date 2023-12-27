import 'package:air_hokey_client/app_router.dart';
import 'package:air_hokey_client/constants/constants.dart';
import 'package:air_hokey_client/game/air_hokey.dart';
import 'package:air_hokey_client/provider/is_debug_proivder.dart';
import 'package:air_hokey_client/util/url_util.dart';
import 'package:air_hokey_client/widget/dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class HokeyPage extends ConsumerWidget {
  const HokeyPage({@PathParam('id') required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDebug = ref.watch(isDebugProvider);
    void showExitDialog() {
      showDialog(
          context: context,
          builder: (context) => ExitRoomDialog(
                onTapYes: () {
                  AutoRouter.of(context).replaceAll([const TopRoute()]);
                },
              ));
    }

    final game = AirHokey(
      isDebug: isDebug,
      id: id,
      showDialog: showExitDialog,
    );
    return Scaffold(
        floatingActionButton: _FloatingQRButton(id: id, isDebug: isDebug),
        body: SafeArea(
          child: GameWidget(
            game: game,
          ),
        ));
  }
}

final qrVisibleProvider = StateProvider<bool>((ref) => false);

class _FloatingQRButton extends HookConsumerWidget {
  const _FloatingQRButton({required this.id, required this.isDebug, super.key});
  final String id;
  final bool isDebug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isVisible = ref.watch(qrVisibleProvider);
    if (isVisible) {
      return _QRContainer(
        id: id,
        isDebug: isDebug,
      );
    }
    return FloatingActionButton(
      onPressed: () {
        ref.read(qrVisibleProvider.notifier).state =
            !ref.read(qrVisibleProvider);
      },
      child: const Icon(Icons.qr_code),
    );
  }
}

class _QRContainer extends ConsumerWidget {
  const _QRContainer({required this.id, required this.isDebug, super.key});
  final String id;
  final bool isDebug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlUtil = UrlUtil(isDebug: isDebug);
    final url = urlUtil.getPageUrl(context.router.currentUrl);
    return AnimatedOpacity(
      opacity: ref.watch(qrVisibleProvider) ? 0.8 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: () {
          ref.read(qrVisibleProvider.notifier).state =
              !ref.read(qrVisibleProvider);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kButtonColor,
          ),
          child: QrImageView(
            data: url.toString(),
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
