part of projects_page;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_projects),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
