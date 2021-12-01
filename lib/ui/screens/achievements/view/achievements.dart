part of achievements_page;

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_achievements),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
