part of about_me;

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
  bool isDarkModeEnabled = false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<AboutMeBloc>().add(GetAboutMeEvent());
    simpleLogger.d('About me: SimpleRefresh: _onRefresh()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
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

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: aboutMe != null ? Text(aboutMe.toJson().toString()) : Container(),
          );
        },
      ),
    );
  }
}
