part of posts_page;

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.page_posts),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
