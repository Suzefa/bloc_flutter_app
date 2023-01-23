import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final VoidCallback onButtonPressed;
  final double? height;
  final double? width;
  final bool isLoading;
  final Color buttonColor;
  const CustomAppButton({Key? key, this.height, this.width,this.buttonColor = ColorConstant.kBlackColor, required this.buttonText, this.textColor=ColorConstant.kWhiteColor, required this.onButtonPressed, this.isLoading = false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0,),
      onTap: onButtonPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.0,),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 7.5,
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: isLoading,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.5,),
                child: SizedBox(
                  height: 15.0,
                  width: 15.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
