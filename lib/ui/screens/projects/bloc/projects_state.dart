part of projects_page;

abstract class _ProjectsState extends Equatable {
  final String? extraMessage;

  _ProjectsState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _ProjectsLoadingState extends _ProjectsState {
  _ProjectsLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _ProjectsLoadedFromStorageState extends _ProjectsState {
  final List<Project> projects;

  _ProjectsLoadedFromStorageState(
    this.projects, {
    String? extraMessage,
  }) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [projects, extraMessage];
}

class _ProjectsLoadedFromNetworkState extends _ProjectsState {
  final List<Project> projects;

  _ProjectsLoadedFromNetworkState(this.projects, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [projects, extraMessage];
}

class _ProjectsErrorState extends _ProjectsState {
  _ProjectsErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
