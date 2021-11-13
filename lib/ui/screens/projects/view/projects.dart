import 'package:cv_for_khamidjon/ui/screens/app_drawer/view/app_drawer.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
