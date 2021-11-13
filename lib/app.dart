// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:cv_for_khamidjon/domain/providers/storage/preferences_provider.dart';
import 'package:cv_for_khamidjon/ui/screens/counter/about_me.dart';
import 'package:cv_for_khamidjon/ui/theme/themes.dart';
import 'package:cv_for_khamidjon/ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base/connection_observer.dart';
import 'base/navigator_observer.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();
  ScaffoldMessengerState get appMessenger => _messengerKey.currentState!;
  // final Directory appDirectory;

  App({
    Key? key,
    // required this.appDirectory,
  }) : super(key: key) {
    // observe network connection
    ConnectionObserver.onChanged.listen((hasConnection) {
      if (hasConnection)
        AppSnackBar.showSuccess(
          appMessenger,
          iconData: Icons.done,
          title: S.current.your_internet_connection_was_restored,
        );
      else
        AppSnackBar.showError(
          appMessenger,
          title: S.current.connection_is_lost,
          description: S.current.please_check_your_internet_connection,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: PreferencesProvider.inMemoryDayNightMode,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        AppNavigatorObserver(),
      ],
      localizationsDelegates: const [
        S.delegate,
        RefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const AboutMePage(),
    );
  }
}
