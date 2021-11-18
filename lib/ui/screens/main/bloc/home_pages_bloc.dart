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

    on<_DownloadCvEvent>((event, emit) async {
      if (_cvLink == null) {
        AppSnackBar.showError(
          ScaffoldMessenger.of(event.context),
          title: "CV link hasn't been loaded yet",
        );
        return;
      }

      if (!(await Permission.storage.request().isGranted)) {
        return;
      }

      // pick folder
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        AppSnackBar.showError(
          ScaffoldMessenger.of(event.context),
          title: "You need to choose a directory to save CV",
        );
        return;
      }

      simpleLogger.d('Khamidjon: selected directory path: $selectedDirectory');
      var file = Directory(selectedDirectory);

      if (await file.exists()) {
        var f = File(path.join(file.path, 'Hello.txt'));
        f.writeAsString('Hello my name is Khamidjon. I am a flutter developer');
        await f.create();
        simpleLogger.d('Khamidjon: file exits. path: ${file.path}');
      } else {
        simpleLogger.d("Khamidjon: file doesn't exist");
      }

      AppSnackBar.showInfo(
        ScaffoldMessenger.of(event.context),
        title: S.current.cv_is_being_downloaded,
      );

      // await FlutterDownloader.enqueue(
      //   url: _cvLink!,
      //   savedDir: Platform.isAndroid ? selectedDirectory : iosPath,
      //   showNotification: true, // show download progress in status bar (for Android)
      //   openFileFromNotification:
      //       true, // click on notification to open downloaded file (for Android)
      // );
    });

    add(_GetAboutMeEvent());
  }

  void downloadCV(BuildContext context) {
    add(_DownloadCvEvent(context));
  }
}
