part of achievements_page;

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  int _selectedIndex = 0;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async =>
      context.read<AchievementsBloc>().add(_GetAchievementGroupEvent(_selectedIndex));

  @override
  void initState() {
    context.read<AchievementsBloc>().stream.listen((state) {
      if (state is _AchievementsErrorState) {
        AppSnackBar.showError(
          ScaffoldMessenger.of(context),
          iconData: Icons.done,
          title: state.extraMessage,
        );
      } else if (state.extraMessage != null) {
        AppSnackBar.showInfo(
          ScaffoldMessenger.of(context),
          title: state.extraMessage!,
        );
      }
    });
    super.initState();
  }

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
          body: SmartRefresher(
            enablePullDown: true,
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.achievementGroup.achievements.length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.r),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2.0.w,
                      ),
                    ),
                    elevation: 15.r,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.achievementGroup.achievements[i].imageLink,
                          // imageBuilder: (context, imageProvider) => Container(
                          //   width: width,
                          //   height: 600,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(12.r),
                          //     shape: BoxShape.rectangle,
                          //     image: DecorationImage(
                          //       image: imageProvider,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: state.menus
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(getBottomSheetIcon(e)),
                      label: e,
                    ),
                  )
                  .toList(),
              currentIndex: state.index,
              unselectedItemColor: Theme.of(context).colorScheme.disabledTextDark,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              onTap: (int index) {
                _selectedIndex = index;
                context.read<AchievementsBloc>().add(_GetAchievementGroupEvent(index));
              }),
        );
      },
    );
  }

  IconData getBottomSheetIcon(String menu) {
    if (menu.toLowerCase().contains('android')) {
      return Icons.android;
    } else if (menu.toLowerCase().contains('algorithms')) {
      return Icons.code;
    }
    return Icons.menu;
  }
}
