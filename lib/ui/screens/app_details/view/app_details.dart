import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDetailsPage extends StatelessWidget {
  AppDetailsPage({Key? key}) : super(key: key);
  final String prefix = '•    ';
  final listTechnologies = [
    'Flutter Flavor',
    'Bloc',
    'Dio',
    'Sembast',
    'Caching Data Locally',
    'Navigation Drawer',
    'Bottom Navigation',
    'Animations',
    'Multi Language',
    'Dark/Light Mode',
    'Json Serializer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_app_details),
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'Technologies used in this app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listTechnologies
                  .map(
                    (text) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        '${prefix}$text',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
