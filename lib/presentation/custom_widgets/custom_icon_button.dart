import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backGroundColor;
  final VoidCallback? onButtonPressed;
  final double? buttonSize;
  final double? elevation;
  final double radius;
  const CustomIconButton({Key? key, required this.icon, this.iconColor, this.backGroundColor, this.onButtonPressed, this.buttonSize=20.0, this.radius=20.0, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation ?? 0.0,
      color: ColorConstant.kTransparentColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onButtonPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backGroundColor,
          ),
          padding: const EdgeInsets.all(8.0,),
          child: Icon(
            icon,
            color: iconColor,
            size: buttonSize,
          ),
        ),
      ),
    );
  }
}
