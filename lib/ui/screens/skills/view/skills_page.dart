part of skills_page;

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkillsView();
  }
}

class SkillsView extends StatefulWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  _SkillsViewState createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  int pressedIndex = -1;

  void _onRefresh() async => context.read<SkillsBloc>().add(_GetSkillsEvent());

  @override
  void initState() {
    context.read<SkillsBloc>().stream.listen((state) {
      if (state is _SkillsErrorState) {
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
        title: Text(S.current.page_skills),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<SkillsBloc, _SkillsState>(
        buildWhen: (prev, current) {
          if (current is _SkillsLoadedFromStorageState ||
              current is _SkillsLoadedFromNetworkState) {
            _refreshController.refreshCompleted();
          } else if (current is _SkillsErrorState) {
            _refreshController.refreshFailed();
            return false;
          } else if (current is _SkillsLoadingState) {
            _refreshController.requestRefresh();
            return false;
          }
          return true;
        },
        builder: (context, state) {
          List<Skill> skills = [];
          if (state is _SkillsLoadedFromNetworkState) {
            skills = state.skills;
          }

          if (state is _SkillsLoadedFromStorageState) {
            skills = state.skills;
          }

          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              itemBuilder: (context, index) => ScaleTap(
                onPressed: () {
                  setState(() {
                    pressedIndex = index;
                  });
                },
                child: _SkillItem(
                  skills[index],
                  isAnimatable: pressedIndex == index,
                ),
              ),
              itemCount: skills.length,
            ),
          );
        },
      ),
    );
  }
}
