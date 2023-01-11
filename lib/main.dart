import 'package:example_project/presentation/route_management/route_generator.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: ColorConstant.kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

