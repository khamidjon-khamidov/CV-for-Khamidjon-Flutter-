part of home_pages;

class _AboutMeState extends Equatable {
  final String? extraMessage;

  _AboutMeState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _AboutMeLoadingState extends _AboutMeState {
  _AboutMeLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _AboutMeLoadedFromStorageState extends _AboutMeState {
  final AboutMe aboutMe;

  _AboutMeLoadedFromStorageState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe, extraMessage];
}

class _AboutMeLoadedFromNetworkState extends _AboutMeState {
  final AboutMe aboutMe;

  _AboutMeLoadedFromNetworkState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe, extraMessage];
}

class _HomePagesErrorState extends _AboutMeState {
  _HomePagesErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
