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
  final List<Post> skills;

  _PostsLoadedFromStorageState(
    this.skills, {
    String? extraMessage,
  }) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [skills, extraMessage];
}

class _PostsLoadedFromNetworkState extends _PostsState {
  final List<Post> skills;

  _PostsLoadedFromNetworkState(this.skills, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [skills, extraMessage];
}

class _PostsErrorState extends _PostsState {
  _PostsErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
