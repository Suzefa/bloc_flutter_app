import 'package:example_project/data/models/explore_item_model.dart';
import 'package:example_project/presentation/custom_screens/home_screen.dart';
import 'package:example_project/presentation/custom_screens/item_view_screen.dart';
import 'package:example_project/presentation/route_management/route_names.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteNames.kInitialRoute:
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