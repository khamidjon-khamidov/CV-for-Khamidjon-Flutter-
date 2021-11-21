part of projects_page;

class ProjectsBloc extends Bloc<_ProjectsEvent, _ProjectsState> {
  final ProjectsRepository _projectsRepository;

  ProjectsBloc(this._projectsRepository) : super(_ProjectsLoadingState()) {
    on<_GetProjectsEvent>(
      (event, emit) async {
        emit(_ProjectsLoadingState());

        BlocResponse response = await _projectsRepository.getProjects();
        if (response is FromNetworkBlocResponse) {
          emit(_ProjectsLoadedFromNetworkState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is FromStorageBlockResponse) {
          emit(_ProjectsLoadedFromStorageState(
            response.data,
            extraMessage: response.extraMessage,
          ));
        } else if (response is ErrorBlockResponse) {
          emit(_ProjectsErrorState(response.extraMessage!));
        }
      },
      transformer: droppable(),
    );

    add(_GetProjectsEvent());
  }
}
