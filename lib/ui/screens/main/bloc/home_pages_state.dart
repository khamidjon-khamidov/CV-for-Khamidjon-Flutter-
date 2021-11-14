part of home_pages;

class AboutMeState extends Equatable {
  final String? extraMessage;

  AboutMeState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class AboutMeLoadingState extends AboutMeState {
  AboutMeLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class AboutMeLoadedFromStorageState extends AboutMeState {
  final AboutMe aboutMe;

  AboutMeLoadedFromStorageState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe];
}

class AboutMeLoadedFromNetworkState extends AboutMeState {
  final AboutMe aboutMe;

  AboutMeLoadedFromNetworkState(this.aboutMe, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [aboutMe];
}

class AboutMeErrorState extends AboutMeState {
  AboutMeErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
