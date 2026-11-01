import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {

    super.onChange(bloc, change);
    debugPrint('$change*******************************************************************************************');

  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   print('${bloc.runtimeType} $transition');
  // }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   print('${bloc.runtimeType} $error $stackTrace');
  //   super.onError(bloc, error, stackTrace);
  // }
}