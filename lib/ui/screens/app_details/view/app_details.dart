import 'package:cv_for_khamidjon/generated/l10n.dart';
import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:flutter/material.dart';

class AppDetailsPage extends StatelessWidget {
  const AppDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_app_details),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
