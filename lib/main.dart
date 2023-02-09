import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'firebase_options.dart';
import 'presentation/route_management/route_generator.dart';
import 'presentation/utilities/bloc_cubit_observer.dart';
import 'presentation/utilities/color_constant.dart';
import 'presentation/utilities/multi_bloc_providers_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocCubitObserver();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Platform.isAndroid
        ? ColorConstant.kWhiteColor
        : ColorConstant.kBlackColor,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: ColorConstant.kTransparentColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviderList.providers(),
      child: MaterialApp(
        builder: (context,child){
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primaryColor: ColorConstant.kPrimaryColor,
          textTheme: GoogleFonts.audiowideTextTheme(),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

