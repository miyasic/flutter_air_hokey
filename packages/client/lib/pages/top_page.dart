import 'package:air_hokey_client/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.router.push(HokeyRoute(id: "id"));
          },
          child: const Text('TopPage'),
        ),
      ),
    );
  }
}
