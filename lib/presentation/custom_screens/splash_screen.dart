import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logics/cubit/splash_screen_cubit/splash_screen_cubit.dart';
import '../custom_widgets/custom_text_widget.dart';
import '../utilities/color_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenCubit screenCubit = context.watch<SplashScreenCubit>();
    screenCubit.onReady(context);
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: GestureDetector(
        onTap: screenCubit.onScreenTap,
        child: Scaffold(
          backgroundColor: ColorConstant.kBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20.0,),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0,),
                    child: Image.asset(
                      "assets/icons/app-icon.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                const CustomTextWidget(
                  text: "Shopping Buddy",
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
