import 'package:cv_for_khamidjon/ui/theme/colors.dart';
import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get warning =>
      this.brightness == Brightness.light ? AppColors.yellowWarning : AppColors.yellowWarning;

  Color get success =>
      this.brightness == Brightness.light ? AppColors.greenSuccess : AppColors.greenSuccess;

  Color get mediumEmphasisTextDark => this.brightness == Brightness.light
      ? AppColors.mediumEmphasisTextDark
      : AppColors.mediumEmphasisTextDark;
}
