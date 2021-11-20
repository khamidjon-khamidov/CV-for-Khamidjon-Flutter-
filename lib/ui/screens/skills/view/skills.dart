part of skills_page;

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_skills),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
