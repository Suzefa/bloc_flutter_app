import 'dart:io';

import 'package:example_project/data/models/explore_item_model.dart';
import 'package:example_project/presentation/custom_widgets/custom_best_selling_widget.dart';
import 'package:example_project/presentation/custom_widgets/custom_explore_item.dart';
import 'package:example_project/presentation/custom_widgets/custom_icon_button.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_field.dart';
import 'package:example_project/presentation/custom_widgets/custom_text_widget.dart';
import 'package:example_project/presentation/utilities/color_constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _removeFocus,
      child: Scaffold(
        appBar: AppBar(
          leading: CustomIconButton(
            icon: Icons.menu,
            iconColor: ColorConstant.kBlackColor,
            buttonSize: 30.0,
            onButtonPressed: (){},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0,top: 5.0,bottom: 5.0,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ColorConstant.kBlackColor,
                ),
                padding: const EdgeInsets.all(7.5),
                child: const Icon(
                  Icons.person,
                  color: ColorConstant.kWhiteColor,
                ),
              ),
            ),
          ],
          backgroundColor: ColorConstant.kBackgroundColor,
          elevation: 0.0,
        ),
        backgroundColor: ColorConstant.kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: Platform.isIOS ? 20.0 : 10.0,
            top: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: CustomTextField(
                        textEditingController: _textEditingController,
                        focusNode: _focusNode,
                        prefixIcon: Icons.search_sharp,
                        elevation: 10.0,
                        borderRadius: 10.0,
                        hintText: "Search",
                      ),
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: ColorConstant.kBlackColor,
                    buttonSize: 30.0,
                    onButtonPressed: (){

                    },
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: CustomTextWidget(
                  text: "Explore",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                flex: 2,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (listContext, index){
                      ExploreItemModel exploreItem = ExploreItemModel.setValues(
                        itemName: "itemName",
                        itemDescription: "itemDescription",
                        itemImageUrl: "",
                        itemPrice: 100.0,
                        isInFavorite: "",
                      );
                      return Container(
                        padding: const EdgeInsets.only(right: 15.0,),
                        alignment: Alignment.center,
                        child: CustomExploreItem(
                          exploreItem: exploreItem,
                          onAddButton: (){},
                        ),
                      );
                    },
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 10.0,),
                child: CustomTextWidget(
                  text: "Best Selling",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (listContext, index){
                      ExploreItemModel exploreItem = ExploreItemModel.setValues(
                        itemName: "itemName",
                        itemDescription: "itemDescription",
                        itemImageUrl: "",
                        itemPrice: 100.0,
                        isInFavorite: "",
                      );
                      return Container(
                        padding: const EdgeInsets.only(right: 15.0,bottom: 10.0,),
                        alignment: Alignment.center,
                        child: CustomBestSellingWidget(
                          exploreItemModel: exploreItem,
                          onButtonPressed: (){},
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _removeFocus(){
    if(_focusNode.hasFocus){
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
}