import 'dart:async';

import 'package:cv_for_khamidjon/domain/providers/preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'base/logger.dart';

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  // load current day night mode and language
  await PreferencesProvider.loadLanToMemoryAndReturn();
  await PreferencesProvider.loadDayNightModeToMemoryAndReturn();

  await runZonedGuarded(
    () async => runApp(
      App(
          // appDirectory: File(''),
          ),
    ),
    (Object error, StackTrace stackTrace) {
      logger.e('Catched root error', error, stackTrace);
      if (kDebugMode) return;
      // todo sent to sentry
    },
  );
}
