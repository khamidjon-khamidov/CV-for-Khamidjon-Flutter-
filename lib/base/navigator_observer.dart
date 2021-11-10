import 'package:cv_for_khamidjon/base/logger.dart';
import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  static const String _tag = "Navigate";
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    blocLogger.d("$_tag from ${previousRoute?.settings.name} ➡️ ${route.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    blocLogger.d("$_tag to ${route.settings.name} ⬅️ ${previousRoute?.settings.name}");
  }
}
