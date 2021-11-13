import 'package:cv_for_khamidjon/ui/screens/app_drawer/view/app_drawer.dart';
import 'package:flutter/material.dart';

class AppDetailsPage extends StatelessWidget {
  const AppDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Details'),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
