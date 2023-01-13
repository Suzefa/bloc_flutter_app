import 'dart:io';

import 'package:example_project/business_logics/bloc/cart_bloc/cart_management_bloc.dart';
import 'package:example_project/business_logics/cubit/color_option_cubit/color_selector_cubit.dart';
import 'package:example_project/data/models/explore_item_model.dart';
import 'package:example_project/presentation/custom_widgets/custom_color_option.dart';
import 'package:example_project/presentation/custom_widgets/custom_icon_button.dart';
import 'package:example_project/presentation/custom_widgets/custom_image_widget.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_widget.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemViewScreen extends StatelessWidget {
  final ExploreItemModel exploreItemModel;
  const ItemViewScreen({Key? key, required this.exploreItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstant.kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(
                          50.0,
                        ),
                      ),
                      child: CustomImageWidget(
                        imageWidget: exploreItemModel.itemImageUrl,
                        height: exploreItemModel.itemImageUrl.isNotEmpty
                            ? double.infinity : 200,
                      ),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: ColorConstant.kTransparentColor,
                  elevation: 0.0,
                  centerTitle: true,
                  title: const CustomTextWidget(
                    text: "Product",
                    textColor: ColorConstant.kBlackColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                  iconTheme: const IconThemeData(
                    color: ColorConstant.kBlackColor,
                  ),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: ColorConstant.kBlackColor,
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0,top: 5.0,bottom: 5.0,),
                      child: Stack(
                        children: [
                          CustomIconButton(
                            icon: Icons.shopping_cart_outlined,
                            iconColor: ColorConstant.kBlackColor,
                            buttonSize: 30.0,
                            onButtonPressed: () {

                            },
                          ),
                          BlocBuilder<CartManagementBloc, CartManagementState>(
                            builder: (context, state) {
                              if(state is CartCountState){
                                return Visibility(
                                  visible: state.totalItem > 0,
                                  child: Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstant.kRedColor,
                                      ),
                                      padding: const EdgeInsets.all(5.0,),
                                      child: FittedBox(
                                        child: CustomTextWidget(
                                          text: "${state.totalItem}",
                                          textColor: ColorConstant.kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0.0,
                  right: 30.0,
                  child: CustomIconButton(
                    elevation: 10.0,
                    icon: Icons.favorite,
                    iconColor: ColorConstant.kRedColor,
                    backGroundColor: ColorConstant.kWhiteColor,
                    radius: 35.0,
                    buttonSize: 30.0,
                    onButtonPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: "\$${exploreItemModel.itemPrice}",
                    textColor: ColorConstant.kRedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: exploreItemModel.itemName,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.star,color: ColorConstant.kYellowColor,size: 20.0,),
                            Icon(Icons.star,color: ColorConstant.kYellowColor,size: 20.0,),
                            Icon(Icons.star,color: ColorConstant.kYellowColor,size: 20.0,),
                            Icon(Icons.star,color: ColorConstant.kYellowColor,size: 20.0,),
                            Icon(Icons.star_border,color: ColorConstant.kYellowColor,size: 20.0,),
                            CustomTextWidget(
                              text: "4.0",
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ColorSelectorCubit,ColorSelectorState>(
                    builder: (context,state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0,),
                        child: Builder(
                            builder: (context) {
                              return CustomColorOption(
                                colorsOptions: exploreItemModel.colorOptions,
                                selectedColor: state.newColor,
                                onColorChanged: (color){
                                  BlocProvider.of<ColorSelectorCubit>(context).changeColor(color);
                                },
                              );
                            }
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){
                BlocProvider.of<CartManagementBloc>(context).add(
                  CartIncrementEvent(exploreItemModel),
                );
              },
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  60.0,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Platform.isIOS ? 30.0 : 10.0,
                  horizontal: 30.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      60.0,
                    ),
                  ),
                  color: ColorConstant.kBlackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add,
                      color: ColorConstant.kWhiteColor,
                    ),
                    CustomTextWidget(
                      text: " Add to Cart",
                      textColor: ColorConstant.kWhiteColor,
                      fontSize: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
