import 'package:currency_and_gold_app/Core/Routes/routes_Constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Global/pages/home_page.dart';

class AppRoutes {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRoutesConsts.currenciesPageName,
      path: AppRoutesConsts.currenciesPagePath,
      pageBuilder: (context, state) => MaterialPage(child: HomePage()),
    ),
  ]);
}
