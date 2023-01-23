import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final IconData? prefixIcon;
  final double? elevation;
  final double? borderRadius;
  final String? hintText;
  final Color? borderColor;
  final Widget? suffixIcon;
  final bool isObscure;
  final bool isEnabled;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final ValueChanged<String>? onInputText;
  const CustomTextField({Key? key,this.isObscure=false, this.suffixIcon , required this.textEditingController, required this.focusNode, this.prefixIcon,this.elevation, this.borderRadius, this.hintText, this.inputAction, this.inputType, this.onInputText, this.borderColor, this.isEnabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
      elevation: elevation ?? 10.0,
      child: TextField(
        enabled: isEnabled,
        obscureText: isObscure,
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
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0,),
          counterText: "",
          fillColor: ColorConstant.kWhiteColor.withOpacity(0.4),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: BorderSide(
              color: borderColor!=null
                  ? borderColor!
                  : ColorConstant.kBlackColor.withOpacity(0.6),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: BorderSide(
              color: borderColor!=null
                  ? borderColor!
                  : ColorConstant.kBlackColor.withOpacity(0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: BorderSide(
              color: borderColor!=null
                  ? borderColor!
                  : ColorConstant.kBlackColor,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0,),
            borderSide: BorderSide(
              color: ColorConstant.kBlackColor.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
