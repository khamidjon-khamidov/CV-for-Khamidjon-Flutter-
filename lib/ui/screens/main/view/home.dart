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
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Hi, I am',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headline5!.color!,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    S.current.my_name,
                    style: GoogleFonts.aBeeZee().copyWith(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 550,
                          child: CachedNetworkImage(
                            imageUrl: aboutMe.pictureLink,
                            placeholder: (_, __) {
                              return Container();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Card(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.one_x_mobiledata,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
