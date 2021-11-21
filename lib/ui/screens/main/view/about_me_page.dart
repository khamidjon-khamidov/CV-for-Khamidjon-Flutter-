part of home_pages;

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AboutMeView();
  }
}

class _AboutMeView extends StatefulWidget {
  const _AboutMeView({Key? key}) : super(key: key);

  @override
  State<_AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<_AboutMeView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<HomePagesBloc>().add(_GetAboutMeEvent());
    simpleLogger.d('About me: SimpleRefresh: _onRefresh()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_about_me),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<HomePagesBloc, _AboutMeState>(
        buildWhen: (previous, current) {
          simpleLogger.d('Khamidjon: got state: $current');
          if (current is _AboutMeLoadedFromNetworkState ||
              current is _AboutMeLoadedFromStorageState) {
            _refreshController.refreshCompleted();
          }
          if (current is _HomePagesErrorState) {
            _refreshController.refreshFailed();
            AppSnackBar.showError(
              ScaffoldMessenger.of(context),
              iconData: Icons.done,
              title: current.extraMessage,
            );
            return false;
          } else if (current is _AboutMeLoadingState) {
            simpleLogger.d('inside about me loading state');
            _refreshController.requestRefresh();
            return false;
          }
          if (!(current is _HomePagesErrorState) && current.extraMessage != null)
            AppSnackBar.showInfo(
              ScaffoldMessenger.of(context),
              title: current.extraMessage!,
            );

          return true;
        },
        builder: (context, state) {
          simpleLogger.d('Khamidjon: State About me inside builder: $state');

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

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    left: 12.w,
                    right: 12.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MyIntro(),
                      _ExperienceText(),
                      SizedBox(height: 30.h),
                      _Details(aboutMe: aboutMe),
                      SizedBox(height: 30.h),
                      _MyInterests(),
                      SizedBox(height: 30.h),
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
