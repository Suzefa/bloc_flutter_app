import 'package:example_project/presentation/custom_screens/home_screen.dart';
import 'package:example_project/presentation/route_management/route_names.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteNames.kInitialRoute:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
      default :
        return null;
    }
  }

}