part of posts_page;

abstract class _PostsState extends Equatable {
  final String? extraMessage;

  _PostsState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _PostsLoadingState extends _PostsState {
  _PostsLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _PostsLoadedFromStorageState extends _PostsState {
  final List<Post> posts;

  _PostsLoadedFromStorageState(
    this.posts, {
    String? extraMessage,
  }) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [posts, extraMessage];
}

class _PostsLoadedFromNetworkState extends _PostsState {
  final List<Post> posts;

  _PostsLoadedFromNetworkState(this.posts, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [posts, extraMessage];
}

class _PostsErrorState extends _PostsState {
  _PostsErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
