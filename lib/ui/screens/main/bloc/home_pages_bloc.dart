part of home_pages;

class HomePagesBloc extends Bloc<_HomePagesEvent, _AboutMeState> {
  final MainRepository _mainRepository;
  String? _cvLink;

  HomePagesBloc(this._mainRepository) : super(_AboutMeLoadingState()) {
    on<_GetAboutMeEvent>(
      (event, emit) async {
        emit(_AboutMeLoadingState());

        try {
          BlocResponse blockResponse = await _mainRepository.getAboutMe();
          if (blockResponse is FromNetworkBlocResponse) {
            _cvLink = (blockResponse.data as AboutMe).cvLink;
            emit(_AboutMeLoadedFromNetworkState(blockResponse.data,
                extraMessage: blockResponse.extraMessage));
          } else if (blockResponse is FromStorageBlockResponse) {
            _cvLink = (blockResponse.data as AboutMe).cvLink;
            emit(_AboutMeLoadedFromStorageState(blockResponse.data,
                extraMessage: blockResponse.extraMessage));
          } else if (blockResponse is ErrorBlockResponse) {
            emit(_AboutMeErrorState(blockResponse.extraMessage!));
          }
        } catch (e) {
          logger.e(e, e);
          emit(_AboutMeErrorState('Unknown error'));
        }
      },
      transformer: droppable(),
    );

    on<_DownloadCvEvent>(
      (event, emit) async {
        if (_cvLink == null) {
          AppSnackBar.showError(
            ScaffoldMessenger.of(event.context),
            title: "CV link hasn't been loaded yet",
          );
          return;
        }

        AppSnackBar.showInfo(
          ScaffoldMessenger.of(event.context),
          title: S.current.cv_is_being_downloaded,
        );

        String? path = await _mainRepository.downloadCV(_cvLink!);

        if (path == null || !(await File(path).exists())) {
          simpleLogger.d('path: $path, isFileExits: ${await File(path ?? '').exists()}');
          AppSnackBar.showError(
            ScaffoldMessenger.of(event.context),
            title: "Sorry, couldn't download CV for some reason!",
          );
          return;
        }

        Share.shareFiles([path], text: 'This is a CV of Khamidjon Khamidov');
      },
      transformer: droppable(),
    );

    add(_GetAboutMeEvent());
  }

  void downloadCV(BuildContext context) {
    add(_DownloadCvEvent(context));
  }
}
