import 'package:equatable/equatable.dart';

abstract class _AchievementsEvent extends Equatable {}

class _GetAchievementsEvent extends _AchievementsEvent {
  @override
  List<Object?> get props => [];
}

class _GetAchievementsInitialEvent extends _AchievementsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class _GetAchievementGroup extends _AchievementsEvent {
  final int index;

  _GetAchievementGroup(this.index);

  @override
  List<Object?> get props => [index];
}

class _GetAchievementsMenu extends _AchievementsEvent {
  @override
  List<Object?> get props => [];
}
