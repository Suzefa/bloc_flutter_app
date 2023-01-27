import 'package:flutter/material.dart';

import '../../business_logics/bloc/sign_up/sign_up_screen_bloc.dart';
import '../utilities/color_constant.dart';
import 'custom_text_widget.dart';

class CustomRadioButton extends StatelessWidget {
  final String buttonTitle;
  final Gender gender;
  final Gender selectedGender;
  final VoidCallback onTap;

  const CustomRadioButton({
    Key? key,
    required this.buttonTitle,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(text: buttonTitle),
          Radio<Gender>(
            activeColor: ColorConstant.kBlackColor,
            value: gender,
            groupValue: selectedGender,
            onChanged: (value)=>{},
          ),
        ],
      ),
    );
  }
}
