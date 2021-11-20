part of skills_page;

abstract class _SkillsState extends Equatable {
  final String? extraMessage;

  _SkillsState({this.extraMessage});

  @override
  List<Object?> get props => [extraMessage];
}

class _SkillsLoadingState extends _SkillsState {
  _SkillsLoadingState({String? extraMessage}) : super(extraMessage: extraMessage);
}

class _SkillsLoadedFromStorageState extends _SkillsState {
  final List<Skill> skills;

  _SkillsLoadedFromStorageState(
    this.skills, {
    String? extraMessage,
  }) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [skills, extraMessage];
}

class _SkillsLoadedFromNetworkState extends _SkillsState {
  final List<Skill> skills;

  _SkillsLoadedFromNetworkState(this.skills, {String? extraMessage})
      : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [skills, extraMessage];
}

class _SkillsErrorState extends _SkillsState {
  _SkillsErrorState(String extraMessage) : super(extraMessage: extraMessage);

  @override
  List<Object?> get props => [extraMessage];
}
