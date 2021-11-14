part of home_pages;

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  final MainRepository _mainRepository;

  AboutMeBloc(this._mainRepository) : super(AboutMeLoadingState()) {
    on<GetAboutMeEvent>(
      (event, emit) async {
        emit(AboutMeLoadingState());

        // try {
        BlocResponse blockResponse = await _mainRepository.getAboutMe();
        if (blockResponse is FromNetworkBlocResponse) {
          emit(AboutMeLoadedFromNetworkState(blockResponse.data,
              extraMessage: blockResponse.extraMessage));
        } else if (blockResponse is FromStorageBlockResponse) {
          emit(AboutMeLoadedFromStorageState(blockResponse.data,
              extraMessage: blockResponse.extraMessage));
        } else if (blockResponse is ErrorBlockResponse) {
          emit(AboutMeErrorState(blockResponse.extraMessage!));
        }
        // } catch (e) {
        //   logger.e(e, e);
        //   emit(AboutMeErrorState('Unknown error'));
        // }
      },
      transformer: droppable(),
    );

    add(GetAboutMeEvent());
  }
}
