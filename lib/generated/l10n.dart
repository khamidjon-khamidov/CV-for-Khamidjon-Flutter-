// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Warning!`
  String get warning {
    return Intl.message(
      'Warning!',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Some error!`
  String get some_error {
    return Intl.message(
      'Some error!',
      name: 'some_error',
      desc: '',
      args: [],
    );
  }

  /// `Function in development`
  String get function_in_development {
    return Intl.message(
      'Function in development',
      name: 'function_in_development',
      desc: '',
      args: [],
    );
  }

  /// `Your internet connection was restored`
  String get your_internet_connection_was_restored {
    return Intl.message(
      'Your internet connection was restored',
      name: 'your_internet_connection_was_restored',
      desc: '',
      args: [],
    );
  }

  /// `Connection is lost`
  String get connection_is_lost {
    return Intl.message(
      'Connection is lost',
      name: 'connection_is_lost',
      desc: '',
      args: [],
    );
  }

  /// `Please check your wifi or mobile network connection`
  String get please_check_your_internet_connection {
    return Intl.message(
      'Please check your wifi or mobile network connection',
      name: 'please_check_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Data Received Successfully`
  String get data_received_successfully {
    return Intl.message(
      'Data Received Successfully',
      name: 'data_received_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Data got from storage due to Network Error`
  String get data_got_from_storage_due_to_network_error {
    return Intl.message(
      'Data got from storage due to Network Error',
      name: 'data_got_from_storage_due_to_network_error',
      desc: '',
      args: [],
    );
  }

  /// `Fetching data failed!`
  String get fetching_data_failed {
    return Intl.message(
      'Fetching data failed!',
      name: 'fetching_data_failed',
      desc: '',
      args: [],
    );
  }

  /// `Khamidjon Khamidov`
  String get my_name {
    return Intl.message(
      'Khamidjon Khamidov',
      name: 'my_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get page_home {
    return Intl.message(
      'Home',
      name: 'page_home',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get page_about_me {
    return Intl.message(
      'About Me',
      name: 'page_about_me',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get page_skills {
    return Intl.message(
      'Skills',
      name: 'page_skills',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get page_achievements {
    return Intl.message(
      'Achievements',
      name: 'page_achievements',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get page_projects {
    return Intl.message(
      'Projects',
      name: 'page_projects',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get page_posts {
    return Intl.message(
      'Posts',
      name: 'page_posts',
      desc: '',
      args: [],
    );
  }

  /// `App Details`
  String get page_app_details {
    return Intl.message(
      'App Details',
      name: 'page_app_details',
      desc: '',
      args: [],
    );
  }

  /// `More Options`
  String get more_options {
    return Intl.message(
      'More Options',
      name: 'more_options',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
