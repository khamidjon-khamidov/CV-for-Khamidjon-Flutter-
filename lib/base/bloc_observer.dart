import 'package:bloc/bloc.dart';

import 'logger.dart';

class AppBlocObserver extends BlocObserver {
  final Function(BlocBase bloc, Object error, StackTrace stackTrace)? errorCallback;

  AppBlocObserver({this.errorCallback});

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    blocLogger.d("${bloc.runtimeType} created");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // blocLogger.v("${bloc.runtimeType} event ${event.runtimeType}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    blocLogger.e("Error", error, stackTrace);
    errorCallback?.call(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    blocLogger.v("${bloc.runtimeType} $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // blocLogger.v("${bloc.runtimeType} transition $transition");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    blocLogger.w("${bloc.runtimeType} closed");
  }
}
