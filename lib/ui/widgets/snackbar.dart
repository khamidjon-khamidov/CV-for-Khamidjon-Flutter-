import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/theme/colors.dart';
import 'package:cv_for_khamidjon/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

enum AppSnackBarGrade { success, warning, error }

extension AppSnackBarGradeExt on AppSnackBarGrade {
  Color get color {
    if (this == AppSnackBarGrade.success)
      return AppColors.greenSuccess;
    else if (this == AppSnackBarGrade.warning)
      return AppColors.yellowWarning;
    else
      return AppColors.red;
  }
}

class AppSnackBar extends SnackBar {
  final String title;
  final String? description;
  final AppSnackBarGrade grade;
  final IconData iconData;

  AppSnackBar({
    required this.title,
    this.description,
    this.grade = AppSnackBarGrade.warning,
    this.iconData = Icons.warning_rounded,
  }) : super(
          backgroundColor: grade.color,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 36.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: AppTextStyles.medium16),
                    if (description?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          description!,
                          style: AppTextStyles.regular12,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );

  static void showSuccess(
    ScaffoldMessengerState scaffoldMessenger, {
    String? title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title ?? S.current.success,
          description: description,
          grade: AppSnackBarGrade.success,
          iconData: iconData ?? Icons.done,
        ),
      );

  static void showWarning(
    ScaffoldMessengerState scaffoldMessenger, {
    String? title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title ?? S.current.warning,
          description: description,
          grade: AppSnackBarGrade.warning,
          iconData: iconData ?? Icons.info_rounded,
        ),
      );

  static void showError(
    ScaffoldMessengerState scaffoldMessenger, {
    String? title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title ?? S.current.some_error,
          description: description,
          grade: AppSnackBarGrade.error,
          iconData: iconData ?? Icons.error,
        ),
      );

  static void functionInDevelopment(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar(
          title: S.current.function_in_development,
          grade: AppSnackBarGrade.warning,
          iconData: Icons.info_rounded,
        ),
      );
}
