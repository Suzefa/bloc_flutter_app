import 'package:example_project/data/models/explore_item_model.dart';
import 'package:example_project/presentation/custom_widgets/custom_icon_button.dart';
import 'package:example_project/presentation/custom_widgets/custom_image_widget.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomBestSellingWidget extends StatelessWidget {
  final ExploreItemModel exploreItemModel;
  final VoidCallback onButtonPressed;
  const CustomBestSellingWidget({Key? key, required this.exploreItemModel, required this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 10.0,
      child: Container(
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
          color: ColorConstant.kWhiteColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(20.0,),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CustomImageWidget(
                backgroundHeight: 70.0,
                backgroundWidth: 70.0,
                imageWidget: exploreItemModel.itemImageUrl,
                height: 70.0,
                width: 70.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,),
                      child: CustomTextWidget(
                        text: exploreItemModel.itemName,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,),
                      child: CustomTextWidget(
                        text: exploreItemModel.itemDescription,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        textColor: ColorConstant.kBlackColor.withOpacity(0.4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,),
                      child: CustomTextWidget(
                        text: "\$${exploreItemModel.itemPrice}",
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomIconButton(
              radius: 15.0,
              buttonSize: 30.0,
              icon: Icons.arrow_forward_rounded,
              iconColor: ColorConstant.kWhiteColor,
              backGroundColor: ColorConstant.kBlackColor,
              onButtonPressed: onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
