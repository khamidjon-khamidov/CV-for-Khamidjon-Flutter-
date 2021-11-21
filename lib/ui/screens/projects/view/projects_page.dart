part of projects_page;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectsView();
  }
}

class ProjectsView extends StatefulWidget {
  ProjectsView({Key? key}) : super(key: key);

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async => context.read<ProjectsBloc>().add(_GetProjectsEvent());

  @override
  void initState() {
    context.read<ProjectsBloc>().stream.listen((state) {
      if (state is _ProjectsErrorState) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_projects),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<ProjectsBloc, _ProjectsState>(
        buildWhen: (prev, current) {
          if (current is _ProjectsLoadedFromStorageState ||
              current is _ProjectsLoadedFromNetworkState) {
            _refreshController.refreshCompleted();
          } else if (current is _ProjectsErrorState) {
            _refreshController.refreshFailed();
            return false;
          } else if (current is _ProjectsLoadingState) {
            _refreshController.requestRefresh();
            return false;
          }
          return true;
        },
        builder: (context, state) {
          List<Project> projects = [];
          if (state is _ProjectsLoadedFromNetworkState) {
            projects = state.projects;
          }

          if (state is _ProjectsLoadedFromStorageState) {
            projects = state.projects;
          }

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              itemBuilder: (context, index) => _ProjectItem(projects[index]),
              itemCount: projects.length,
            ),
          );
        },
      ),
    );
  }
}
