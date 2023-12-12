import 'package:auto_route/auto_route.dart';
import 'package:air_hokey_client/pages/hokey_page.dart';
import 'package:air_hokey_client/pages/top_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(
          path: '/hokey-route',
          redirectTo: '/',
        ),
        AutoRoute(
          path: '/',
          page: TopRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/hokey-route/:id',
          page: HokeyRoute.page,
        ),
      ];
}
