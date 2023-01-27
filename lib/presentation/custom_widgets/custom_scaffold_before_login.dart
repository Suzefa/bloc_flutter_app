import 'package:flutter/material.dart';

import '../utilities/color_constant.dart';

class CustomScaffoldBeforeLogin extends StatelessWidget {
  final Function? onScreenTap;
  final Widget child;
  const CustomScaffoldBeforeLogin({Key? key, this.onScreenTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onScreenTap!=null){
          onScreenTap!();
        }
      },
      child: Scaffold(
        backgroundColor: ColorConstant.kBackgroundColor,
        body: SafeArea(
          bottom: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorConstant.kWhiteColor,
                  borderRadius: BorderRadius.circular(20.0,),
                  boxShadow: const [
                    BoxShadow(
                      color: ColorConstant.kShadowColor,
                      offset: Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );  }
}
