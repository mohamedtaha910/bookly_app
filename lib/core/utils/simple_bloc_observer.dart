// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // log(change.toString());
    debugPrint(change.toString());
    super.onChange(bloc, change);
  }


  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   super.onError(bloc, error, stackTrace);
  // }
}
