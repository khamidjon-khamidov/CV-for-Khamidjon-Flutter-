part of achievements_page;

abstract class _AchievementsEvent extends Equatable {}

class _GetAchievementsEvent extends _AchievementsEvent {
  @override
  List<Object?> get props => [];
}

class _GetAchievementsInitialEvent extends _AchievementsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class _GetAchievementGroupEvent extends _AchievementsEvent {
  final int index;

  _GetAchievementGroupEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class _GetAchievementsMenuEvent extends _AchievementsEvent {
  @override
  List<Object?> get props => [];
}
