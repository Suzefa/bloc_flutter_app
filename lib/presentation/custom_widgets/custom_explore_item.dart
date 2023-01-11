import 'package:example_project/data/models/explore_item_model.dart';
import 'package:example_project/presentation/custom_widgets/custom_icon_button.dart';
import 'package:example_project/presentation/custom_widgets/custom_image_widget.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_widget.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class CustomExploreItem extends StatelessWidget {
  final ExploreItemModel exploreItem;
  final VoidCallback onAddButton;
  const CustomExploreItem({Key? key, required this.exploreItem, required this.onAddButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(18.5),
      child: Container(
        width: 250.0,
        decoration: BoxDecoration(
          color: ColorConstant.kWhiteColor,
          borderRadius: BorderRadius.circular(18.5),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.5),
              child: Stack(
                children: [
                  Center(
                    child: CustomImageWidget(
                      imageWidget: exploreItem.itemImageUrl,
                      height: 180,
                      width: 230,
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: CustomIconButton(
                      icon: exploreItem.isInFavorite == "true"
                          ? Icons.favorite : Icons.favorite_border,
                      iconColor: ColorConstant.kWhiteColor,
                      backGroundColor: ColorConstant.kRedColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,),
              child: CustomTextWidget(
                text: exploreItem.itemName,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,),
              child: CustomTextWidget(
                text: exploreItem.itemDescription,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                textColor: ColorConstant.kBlackColor.withOpacity(0.4),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0,),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,),
                    child: CustomTextWidget(
                      text: "\$${exploreItem.itemPrice}",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      textColor: ColorConstant.kBlackColor,
                    ),
                  ),
                  const Spacer(),
                  CustomIconButton(
                    radius: 30.0,
                    icon: Icons.add,
                    iconColor: ColorConstant.kWhiteColor,
                    backGroundColor: ColorConstant.kBlackColor,
                    onButtonPressed: onAddButton,
                    buttonSize: 28.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
