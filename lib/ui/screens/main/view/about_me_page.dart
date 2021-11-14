part of home_pages;

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AboutMeView();
  }
}

class AboutMeView extends StatefulWidget {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<AboutMeBloc>().add(GetAboutMeEvent());
    simpleLogger.d('About me: SimpleRefresh: _onRefresh()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_about_me),
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
              child: Container(),
            );
          }

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    left: 12,
                    right: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyIntro(),
                      ExperienceText(),
                      SizedBox(height: 30),
                      Details(aboutMe: aboutMe),
                      SizedBox(height: 30),
                      MyInterests(),
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
