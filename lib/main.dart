import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/route_management/route_generator.dart';
import 'presentation/utilities/bloc_cubit_observer.dart';
import 'presentation/utilities/color_constant.dart';
import 'presentation/utilities/multi_bloc_providers_list.dart';

import 'presentation/route_management/route_generator.dart';
import 'presentation/utilities/bloc_cubit_observer.dart';
import 'presentation/utilities/color_constant.dart';
import 'presentation/utilities/multi_bloc_providers_list.dart';

void main() {
  Bloc.observer = BlocCubitObserver();
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
          textTheme: GoogleFonts.audiowideTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

