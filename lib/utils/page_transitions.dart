import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

abstract class PageTransition {
  static MaterialPageRoute noTransition(Widget child) =>
      MaterialPageRoute<void>(builder: (context) => child);

  static PageRouteBuilder slide(Widget child, [RouteSettings? settings]) => PageRouteBuilder<void>(
        settings: settings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (context, a1, a2, child) => SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(a1),
          child: child,
        ),
        transitionDuration: 300.milliseconds,
      );

  static PageRouteBuilder growingUp(Widget child, [RouteSettings? settings]) =>
      PageRouteBuilder<void>(
        settings: settings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (context, a1, a2, child) => SlideTransition(
          position: Tween(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
          ).animate(a1),
          child: child,
        ),
        transitionDuration: 300.milliseconds,
      );

  static PageRouteBuilder fade(Widget child, [RouteSettings? settings]) => PageRouteBuilder<void>(
        settings: settings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (context, a1, a2, child) => FadeTransition(
          opacity: a1,
          child: child,
        ),
        transitionDuration: 300.milliseconds,
      );

  static PageRouteBuilder size(Widget child, [RouteSettings? settings]) => PageRouteBuilder<void>(
        settings: settings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (context, a1, a2, child) => ScaleTransition(
          scale: a1,
          child: child,
        ),
        transitionDuration: 300.milliseconds,
      );
}
