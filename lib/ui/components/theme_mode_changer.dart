import 'package:cv_for_khamidjon/utils/app_level_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeModeChanger extends StatefulWidget {
  @override
  _ThemeModeChangerState createState() => _ThemeModeChangerState();
}

class _ThemeModeChangerState extends State<ThemeModeChanger> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: IconButton(
          onPressed: () {
            _controller.forward().whenComplete(() {
              // todo
              AppLevelVariables.currentThemeMode =
                  AppLevelVariables.currentThemeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
              setState(() {
                
              });
              _controller.reset();
            });
          },
          icon: Icon(
            AppLevelVariables.currentThemeMode == ThemeMode.dark
                ? Icons.nights_stay
                : Icons.wb_sunny,
            color: Theme.of(context).textTheme.headline1?.color ??
                Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
