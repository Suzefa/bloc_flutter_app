import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final IconData? prefixIcon;
  final double? elevation;
  final double? borderRadius;
  final String? hintText;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final ValueChanged<String>? onInputText;
  const CustomTextField({Key? key, required this.textEditingController, required this.focusNode, this.prefixIcon,this.elevation, this.borderRadius, this.hintText, this.inputAction, this.inputType, this.onInputText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
      elevation: elevation ?? 10.0,
      child: TextField(
        onChanged: onInputText,
        controller: textEditingController,
        focusNode: focusNode,
        textInputAction: inputAction,
        keyboardType: inputType,
        cursorColor: ColorConstant.kBlackColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorConstant.kBlackColor.withOpacity(0.6),
            fontStyle: FontStyle.italic,
          ),
          prefixIcon: prefixIcon!= null
              ? Icon(prefixIcon,color: ColorConstant.kBlackColor,)
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0,),
          counterText: "",
          fillColor: ColorConstant.kWhiteColor.withOpacity(0.4),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: BorderSide(color: ColorConstant.kWhiteColor.withOpacity(0.4),),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: const BorderSide(color: ColorConstant.kBlackColor,width: 1.5,),
          ),
        ),
      ),
    );
  }
}
