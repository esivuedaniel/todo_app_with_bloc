import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print("${bloc.runtimeType} Created");
    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print("OnEvent: ${bloc.state}");
    }
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print("OnError: ${bloc.state}");
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print("$bloc Transition - $transition");
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print("$bloc Change - $change");
    }
    super.onChange(bloc, change);
  }
}