import 'package:example_project/presentation/route_management/route_generator.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:example_project/presentation/utilities/multi_bloc_providers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviderList.providers(),
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primaryColor: ColorConstant.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

