import 'package:cv_for_khamidjon/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: AppBarTheme(color: AppColors.colorPrimaryLight),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.colorAccentLight,
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        appBarTheme: AppBarTheme(color: AppColors.colorAppBar),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.colorAccentDark,
        ),
        canvasColor: AppColors.screenBackgroundDark,
        dividerColor: AppColors.disabledTextDark,
        primaryColor: AppColors.colorPrimaryDark,
        scaffoldBackgroundColor: AppColors.screenBackgroundDark,
        textTheme: TextTheme(
          headline1: TextStyle(color: AppColors.highEmphasisTextDark),
          headline2: TextStyle(color: AppColors.highEmphasisTextDark),
          headline3: TextStyle(color: AppColors.highEmphasisTextDark),
          headline4: TextStyle(color: AppColors.disabledTextDark),
          headline5: TextStyle(color: AppColors.highEmphasisTextDark),
          headline6: TextStyle(color: AppColors.highEmphasisTextDark),
          subtitle1: TextStyle(color: AppColors.highEmphasisTextDark),
          subtitle2: TextStyle(color: AppColors.highEmphasisTextDark),
          bodyText1: TextStyle(color: AppColors.highEmphasisTextDark),
          bodyText2: TextStyle(color: AppColors.highEmphasisTextDark),
          button: TextStyle(color: AppColors.highEmphasisTextDark),
          caption: TextStyle(color: AppColors.highEmphasisTextDark),
          overline: TextStyle(color: AppColors.highEmphasisTextDark),
        ),
      );
}
