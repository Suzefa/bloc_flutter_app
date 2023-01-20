import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logics/cubit/splash_screen_cubit/splash_screen_cubit.dart';
import '../../data/models/explore_item_model.dart';
import '../custom_screens/home_screen.dart';
import '../custom_screens/item_view_screen.dart';
import '../custom_screens/splash_screen.dart';
import 'route_names.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context){
            return BlocProvider<SplashScreenCubit>(
              create: (context)=> SplashScreenCubit(),
              child: const SplashScreen(),
            );
          },
        );
      case RouteNames.kHomeScreenRoute:
        return MaterialPageRoute(builder: (context)=> const HomeScreen(),);
      case RouteNames.kItemViewScreenRoute:
        ExploreItemModel argument = settings.arguments as ExploreItemModel;
        return MaterialPageRoute(
          builder: (context)=> ItemViewScreen(
            exploreItemModel: argument,
          ),
        );
      default :
        return null;
    }
  }

}