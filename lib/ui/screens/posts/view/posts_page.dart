part of posts_page;

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostsView();
  }
}

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async => context.read<PostsBloc>().add(_GetPostsEvent());

  @override
  void initState() {
    context.read<PostsBloc>().stream.listen((state) {
      if (state is _PostsErrorState) {
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
        title: Text(S.current.page_posts),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<PostsBloc, _PostsState>(
        buildWhen: (prev, current) {
          if (current is _PostsLoadedFromStorageState || current is _PostsLoadedFromNetworkState) {
            _refreshController.refreshCompleted();
          } else if (current is _PostsErrorState) {
            _refreshController.refreshFailed();
            return false;
          } else if (current is _PostsLoadingState) {
            _refreshController.requestRefresh();
            return false;
          }
          return true;
        },
        builder: (context, state) {
          List<Post> posts = [];
          if (state is _PostsLoadedFromNetworkState) {
            posts = state.posts;
          }

          if (state is _PostsLoadedFromStorageState) {
            posts = state.posts;
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
                onPressed: () {},
                child: Text('${posts[index].title}'),
              ),
              itemCount: posts.length,
            ),
          );
        },
      ),
    );
  }
}
