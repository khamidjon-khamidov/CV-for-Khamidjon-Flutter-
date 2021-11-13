import 'dart:async';

import 'package:cv_for_khamidjon/base/database.dart';
import 'package:cv_for_khamidjon/base/dio_builder.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/preferences_provider.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/ui/screens/counter/about_me.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sembast/sembast.dart';

import 'app.dart';
import 'base/logger.dart';

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  // load current day night mode and language
  await PreferencesProvider.loadLanToMemoryAndReturn();
  await PreferencesProvider.loadDayNightModeToMemoryAndReturn();

  Database appDatabase = await AppDatabase.instance.database;

  await runZonedGuarded(
    () async => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<MainRepository>(
            create: (context) => MainRepository(
              dio: DioBuilder.dio,
              database: appDatabase,
            ),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AboutMeBloc>(
              create: (context) => AboutMeBloc(context.read<MainRepository>()),
            )
          ],
          child: App(),
        ),
      ),
    ),
    (Object error, StackTrace stackTrace) {
      logger.e('Catched root error in runZonedGuarded', error, stackTrace);
      if (kDebugMode) return;
      // todo sent to sentry
    },
  );
}
