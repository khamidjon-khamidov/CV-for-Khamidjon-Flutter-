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
  String? cvLink;

  @override
  void initState() {
    context.read<HomePagesBloc>().stream.listen((state) {
      if (state is _HomePagesErrorState) {
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

  void _onRefresh() async {
    context.read<HomePagesBloc>().add(_GetAboutMeEvent());
    simpleLogger.d('About me: SimpleRefresh: _onRefresh()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_home),
        actions: [
          InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              if (cvLink == null) return;
              context.read<HomePagesBloc>().downloadCV(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  AppImages.cv,
                  width: 26.w,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<HomePagesBloc, _AboutMeState>(
        buildWhen: (previous, current) {
          simpleLogger.d('Khamidjon: got state: $current');
          if (current is _AboutMeLoadedFromNetworkState ||
              current is _AboutMeLoadedFromStorageState) {
            _refreshController.refreshCompleted();
          } else if (current is _HomePagesErrorState) {
            _refreshController.refreshFailed();
            return false;
          } else if (current is _AboutMeLoadingState) {
            _refreshController.requestRefresh();
            return false;
          }

          return true;
        },
        builder: (context, state) {
          AboutMe? aboutMe = null;
          if (state is _AboutMeLoadedFromStorageState) {
            aboutMe = state.aboutMe;
          }
          if (state is _AboutMeLoadedFromNetworkState) {
            aboutMe = state.aboutMe;
          }

          if (aboutMe == null) {
            return SmartRefresher(
              enablePullDown: true,
              header: WaterDropMaterialHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: Container(),
            );
          }

          cvLink = aboutMe.cvLink;

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: Theme.of(context).splashColor.withAlpha((255 * 0.15).toInt()),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _TopTitle(),
                          _ImageExperience(pictureLink: aboutMe.pictureLink),
                          _SkillDescription(description: aboutMe.description),
                          SizedBox(height: 18.h),
                          _ContactItems(),
                          SizedBox(height: 24.h),
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
