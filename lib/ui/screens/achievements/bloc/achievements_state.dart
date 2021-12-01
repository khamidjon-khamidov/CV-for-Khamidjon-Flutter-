part of achievements_page;

abstract class _AchievementsState extends Equatable {
  final String? extraMessage;

  _AchievementsState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _AchievementsLoadingState extends _AchievementsState {
  _AchievementsLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _AchievementsLoadedState extends _AchievementsState {
  _AchievementsLoadedState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _AchievementsMenuLoadingState extends _AchievementsState {
  _AchievementsMenuLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _AchievementsErrorState extends _AchievementsState {
  _AchievementsErrorState(String extraMessage) : super(extraMessage: extraMessage);
}

class _AchievementsMenuLoadedState extends _AchievementsState {
  final List<String> menu;

  _AchievementsMenuLoadedState(
    this.menu, {
    String? extraMessage,
  }) : super(extraMessage: extraMessage);
}

class _AchievementsGroupLoadingState extends _AchievementsState {
  final int index;

  _AchievementsGroupLoadingState({
    required this.index,
    String? extraMessage,
  }) : super(extraMessage: extraMessage);
}

class _AchievementsGroupLoadedState extends _AchievementsState {
  final int index;
  final AchievementGroup achievementGroup;

  _AchievementsGroupLoadedState({
    required this.index,
    required this.achievementGroup,
    String? extraMessage,
  }) : super(extraMessage: extraMessage);
}
