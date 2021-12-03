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
      buildWhen: (prev, current) {
        print('Khamidjon: got state: $current');
        if (current is _AchievementsLoadedState) {
          context.read<AchievementsBloc>().add(_GetAchievementGroupEvent(0));
          return false;
        }
        return current is _AchievementsGroupLoadedState || current is _AchievementsLoadingState;
      },
      builder: (context, state) {
        if (state is _AchievementsLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        state as _AchievementsGroupLoadedState;

        return Scaffold(
          appBar: AppBar(
            title: Text(state.achievementGroup.title),
          ),
          drawer: AppDrawer(),
          body: Container(
            child: Text(state.achievementGroup.title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: state.menus
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(Icons.done),
                    label: e,
                  ),
                )
                .toList(),
            currentIndex: state.index,
            unselectedItemColor: Theme.of(context).colorScheme.disabledTextDark,
            selectedItemColor: Theme.oaf(context).colorScheme.secondary,
            onTap: (int index) {
              print('Khamidjon: tapped bottom: $index');
              context.read<AchievementsBloc>().add(_GetAchievementGroupEvent(index));
            },
          ),
        );
      },
    );
  }
}
