part of achievements_page;

class AchievementsBloc extends Bloc<_AchievementsEvent, _AchievementsState> {
  final AchievementsRepository _achievementsRepository;
  List<AchievementGroup> achievementGroups = [];
  List<String> menus = [];

  AchievementsBloc(this._achievementsRepository) : super(_AchievementsLoadingState()) {
    _achievementsRepository.getAchievements();
    on<_GetAchievementsEvent>(
      (event, emit) async {
        emit(_AchievementsLoadingState());

        BlocResponse response = await _achievementsRepository.getAchievements();

        if (response is FromNetworkBlocResponse) {
          achievementGroups = response.data;
        } else if (response is FromStorageBlockResponse) {
          achievementGroups = response.data;
        } else if (response is ErrorBlockResponse) {
          emit(_AchievementsErrorState(response.extraMessage!));
          return;
        }
        addMenus(achievementGroups);
        emit(_AchievementsLoadedState(extraMessage: response.extraMessage));
      },
      transformer: droppable(),
    );

    on<_GetAchievementsMenuEvent>(
      (event, emit) async {
        if (menus.isEmpty) {
          add(_GetAchievementsEvent());
          return;
        }

        emit(_AchievementsMenuLoadedState(menus));
      },
      transformer: droppable(),
    );

    on<_GetAchievementGroupEvent>(
      (event, emit) async {
        emit(
          _AchievementsGroupLoadedState(
            index: event.index,
            achievementGroup: achievementGroups[event.index],
          ),
        );
      },
      transformer: restartable(),
    );

    add(_GetAchievementsEvent());
  }

  void addMenus(List<AchievementGroup> groups) {
    menus = groups.map((e) => e.title).toList();
  }
}
