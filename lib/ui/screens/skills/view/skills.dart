import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
