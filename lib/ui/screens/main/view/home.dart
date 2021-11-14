part of home_pages;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<AboutMeBloc>().add(GetAboutMeEvent());
    simpleLogger.d('About me: SimpleRefresh: _onRefresh()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_home),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<AboutMeBloc, AboutMeState>(
        buildWhen: (previous, current) {
          simpleLogger.d('Khamidjon: got state: $current');
          if (current is AboutMeLoadedFromNetworkState ||
              current is AboutMeLoadedFromStorageState) {
            _refreshController.refreshCompleted();
          }
          if (current is AboutMeErrorState) {
            _refreshController.refreshFailed();
            AppSnackBar.showError(
              ScaffoldMessenger.of(context),
              iconData: Icons.done,
              title: current.extraMessage,
            );
            return false;
          } else if (current is AboutMeLoadingState) {
            simpleLogger.d('inside about me loading state');
            _refreshController.requestRefresh();
            return false;
          }
          if (!(current is AboutMeErrorState) && current.extraMessage != null)
            AppSnackBar.showInfo(
              ScaffoldMessenger.of(context),
              title: current.extraMessage!,
            );

          return true;
        },
        builder: (context, state) {
          simpleLogger.d('Khamidjon: State About me inside builder: $state');

          AboutMe? aboutMe = null;
          if (state is AboutMeLoadedFromStorageState) {
            aboutMe = state.aboutMe;
          }
          if (state is AboutMeLoadedFromNetworkState) {
            aboutMe = state.aboutMe;
          }

          if (aboutMe == null) {
            return SmartRefresher(
              enablePullDown: true,
              header: WaterDropMaterialHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: aboutMe != null ? Text(aboutMe.toJson().toString()) : Container(),
            );
          }
// Theme.of(context).primaryColor.withAlpha((256 * 0.2).toInt())
          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: Theme.of(context).splashColor.withAlpha((255 * 0.15).toInt()),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TopTitle(),
                          ImageExperience(pictureLink: aboutMe.pictureLink),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
