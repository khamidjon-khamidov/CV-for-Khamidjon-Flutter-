import 'package:cv_for_khamidjon/ui/components/app_drawer.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
