import 'dart:async';

import 'package:cv_for_khamidjon/base/database.dart';
import 'package:cv_for_khamidjon/base/dio_builder.dart';
import 'package:cv_for_khamidjon/domain/providers/storage/preferences_provider.dart';
import 'package:cv_for_khamidjon/domain/repositories/main_repository.dart';
import 'package:cv_for_khamidjon/domain/repositories/projects_repository.dart';
import 'package:cv_for_khamidjon/domain/repositories/skills_repository.dart';
import 'package:cv_for_khamidjon/ui/screens/main/home_pages.dart';
import 'package:cv_for_khamidjon/ui/screens/projects/projects.dart';
import 'package:cv_for_khamidjon/ui/screens/skills/skills_page.dart';
import 'package:cv_for_khamidjon/utils/app_level_variables.dart';
import 'package:cv_for_khamidjon/utils/app_settings_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sembast/sembast.dart';

import 'app.dart';
import 'base/logger.dart';

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  // load current day night mode and language
  await PreferencesProvider.loadLanToMemoryAndReturn();
  await PreferencesProvider.loadDayNightModeToMemoryAndReturn();

  // load database
  Database appDatabase = await AppDatabase.instance.database;

  // load current settings
  AppLevelVariables.currentThemeMode = PreferencesProvider.inMemoryDayNightMode;
  AppLevelVariables.currentLocale = PreferencesProvider.inMemoryLocale;

  await runZonedGuarded(
    () async => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<MainRepository>(
            create: (context) => MainRepository(
              dio: DioBuilder.dio,
              database: appDatabase,
            ),
          ),
          RepositoryProvider<SkillsRepository>(
            create: (context) => SkillsRepository(
              dio: DioBuilder.dio,
              database: appDatabase,
            ),
          ),
          RepositoryProvider<ProjectsRepository>(
            create: (context) => ProjectsRepository(
              dio: DioBuilder.dio,
              database: appDatabase,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomePagesBloc>(
              create: (context) => HomePagesBloc(context.read<MainRepository>()),
            ),
            BlocProvider<AppSettingsCubit>(
              create: (context) => AppSettingsCubit(),
            ),
            BlocProvider<SkillsBloc>(
              create: (context) => SkillsBloc(context.read<SkillsRepository>()),
            ),
            BlocProvider<ProjectsBloc>(
              create: (context) => ProjectsBloc(context.read<ProjectsRepository>()),
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
