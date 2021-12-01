part of achievements_page;

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsBloc, _AchievementsState>(
      buildWhen: (prev, current) =>
          current is _AchievementsMenuLoadedState || current is _AchievementsLoadingState,
      builder: (context, state) {
        if (state is _AchievementsLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.page_achievements),
          ),
          drawer: AppDrawer(),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            items: [],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            onTap: (int index) {
              // todo
            },
          ),
        );
      },
    );
  }
}
