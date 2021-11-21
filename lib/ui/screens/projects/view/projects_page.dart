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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_projects),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<ProjectsBloc, _ProjectsState>(
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
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                itemBuilder: (context, index) => Text('${projects[index].title}'),
                itemCount: projects.length),
          );
        },
      ),
    );
  }
}
