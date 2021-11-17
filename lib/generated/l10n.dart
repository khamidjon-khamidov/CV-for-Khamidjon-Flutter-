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

  /// `Hi, I am`
  String get hiI_am {
    return Intl.message(
      'Hi, I am',
      name: 'hiI_am',
      desc: '',
      args: [],
    );
  }

  /// `Mobile\nDevelopment`
  String get mobile_development {
    return Intl.message(
      'Mobile\nDevelopment',
      name: 'mobile_development',
      desc: '',
      args: [],
    );
  }

  /// `Algorithms\nC/C++`
  String get algorithms_cc {
    return Intl.message(
      'Algorithms\nC/C++',
      name: 'algorithms_cc',
      desc: '',
      args: [],
    );
  }

  /// `Web\nDevelopment`
  String get web_development {
    return Intl.message(
      'Web\nDevelopment',
      name: 'web_development',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get flutter_developer {
    return Intl.message(
      'Flutter Developer',
      name: 'flutter_developer',
      desc: '',
      args: [],
    );
  }

  /// `My Intro`
  String get my_intro {
    return Intl.message(
      'My Intro',
      name: 'my_intro',
      desc: '',
      args: [],
    );
  }

  /// `I have been in programming since 2017. Over this period, I have acquired skills Algorithms in C/C++, Python, Java/Kotlin Android, ReactJs, NodeJs, Flutter. My main tech stack currently is Flutter Development which I started my first experience in September, 2020.`
  String get experience_description {
    return Intl.message(
      'I have been in programming since 2017. Over this period, I have acquired skills Algorithms in C/C++, Python, Java/Kotlin Android, ReactJs, NodeJs, Flutter. My main tech stack currently is Flutter Development which I started my first experience in September, 2020.',
      name: 'experience_description',
      desc: '',
      args: [],
    );
  }

  /// `Development Experience`
  String get development_experience {
    return Intl.message(
      'Development Experience',
      name: 'development_experience',
      desc: '',
      args: [],
    );
  }

  /// `• Algorithms(C/C++) - 1.5 years\n• Java/Kotlin Android - 2 years\n• Flutter - since 2020\n• Python Automation\n• Bash Scripts\n• NodeJs\n• ReactJs\n`
  String get experience_details {
    return Intl.message(
      '• Algorithms(C/C++) - 1.5 years\n• Java/Kotlin Android - 2 years\n• Flutter - since 2020\n• Python Automation\n• Bash Scripts\n• NodeJs\n• ReactJs\n',
      name: 'experience_details',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Since September, 2017`
  String get experience_start_date {
    return Intl.message(
      'Since September, 2017',
      name: 'experience_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personal_details {
    return Intl.message(
      'Personal Details',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `My Interests`
  String get my_interests {
    return Intl.message(
      'My Interests',
      name: 'my_interests',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Film`
  String get film {
    return Intl.message(
      'Film',
      name: 'film',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Chess`
  String get chess {
    return Intl.message(
      'Chess',
      name: 'chess',
      desc: '',
      args: [],
    );
  }

  /// `CV is being downloaded`
  String get cv_is_being_downloaded {
    return Intl.message(
      'CV is being downloaded',
      name: 'cv_is_being_downloaded',
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
