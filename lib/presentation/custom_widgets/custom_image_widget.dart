import 'dart:io';

import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageWidget;
  final double? height;
  final double? width;
  const CustomImageWidget({Key? key, required this.imageWidget, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(imageWidget.startsWith("http://") ||imageWidget.startsWith("https://")) {
      return Image.network(
        imageWidget,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if(imageWidget.isEmpty){
      return Icon(
        Icons.image,
        size: height,
        color: ColorConstant.kBackgroundColor,
      );
    } else {
      return Image.file(
        File(imageWidget),
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
  }

}
