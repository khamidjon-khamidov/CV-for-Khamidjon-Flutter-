part of skills_page;

class SkillsBloc extends Bloc<_SkillsEvent, _SkillsState> {
  final SkillsRepository _skillsRepository;

  SkillsBloc(this._skillsRepository) : super(_SkillsLoadingState()) {
    on<_GetSkillsEvent>(
      (event, emit) async {
        emit(_SkillsLoadingState());

        BlocResponse response = await _skillsRepository.getSkills();
        if (response is FromNetworkBlocResponse) {
          emit(_SkillsLoadedFromNetworkState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is FromStorageBlockResponse) {
          emit(_SkillsLoadedFromStorageState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is ErrorBlockResponse) {
          emit(_SkillsErrorState(response.extraMessage!));
        }
      },
      transformer: droppable(),
    );
  }
}
