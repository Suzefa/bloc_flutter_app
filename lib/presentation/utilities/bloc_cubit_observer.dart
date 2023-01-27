import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCubitObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    log("$bloc is Created",name: "BLOC");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log("$bloc is Closed",name: "BLOC");
    super.onClose(bloc);
  }

}