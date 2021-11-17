part of home_pages;

abstract class _HomePagesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class _GetAboutMeEvent extends _HomePagesEvent {}

class _DownloadCvEvent extends _HomePagesEvent {
  final BuildContext context;

  _DownloadCvEvent(this.context);
}
