import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/route_management/route_names.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState());

  int _seconds = 0;

  void onReady(BuildContext context){
    _startTimer(context);
  }

  void _startTimer(BuildContext context){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds+=1;
      if(_seconds==10){
        timer.cancel();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.kSignInScreenRoute,
              (page)=> false,
        );
      }
    });
  }

  void onScreenTap(){
    _seconds = 9;
  }

}
