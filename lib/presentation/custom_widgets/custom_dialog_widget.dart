import 'package:flutter/material.dart';

import '../utilities/color_constant.dart';


class CustomDialogWidget extends StatelessWidget {
  final String message;
  final bool showErrorMessage;

  const CustomDialogWidget({
    Key? key,
    required this.message,
    this.showErrorMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth>600) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Container(
                width: 500,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: showErrorMessage
                            ? ColorConstant.kRedColor
                            : ColorConstant.kGreenColor,
                        borderRadius: BorderRadius.circular(10.0,),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7.5,
                        horizontal: 10.0,
                      ),
                      child: _MesssageCompoenet(
                        errorMsg: message,
                        showErrorMsg: showErrorMessage,
                        textColor: showErrorMessage
                            ? ColorConstant.kRedColor
                            : ColorConstant.kGreenColor,
                      ),
                    ),

                    Positioned(
                      right: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 480.0,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: ColorConstant.kWhiteColor,
                            borderRadius: BorderRadius.circular(10.0,),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 7.5,
                            horizontal: 10.0,
                          ),
                          child: _MesssageCompoenet(
                            errorMsg: message,
                            showErrorMsg: showErrorMessage,
                            textColor: ColorConstant.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          );
        } else {
          return Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: showErrorMessage
                      ? ColorConstant.kRedColor
                      : ColorConstant.kGreenColor,
                  borderRadius: BorderRadius.circular(10.0,),
                ),
                padding: const EdgeInsets.symmetric(vertical: 7.5,horizontal: 10.0,),
                child: _MesssageCompoenet(
                  errorMsg: message,
                  showErrorMsg: showErrorMessage,
                  textColor: showErrorMessage
                      ? ColorConstant.kRedColor
                      : ColorConstant.kGreenColor,
                ),
              ),

              Positioned(
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-60,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: ColorConstant.kWhiteColor,
                      borderRadius: BorderRadius.circular(10.0,),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.5,
                      horizontal: 10.0,
                    ),
                    child: _MesssageCompoenet(
                      errorMsg: message,
                      showErrorMsg: showErrorMessage,
                      textColor: ColorConstant.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _MesssageCompoenet extends StatelessWidget {
  final String errorMsg;
  final bool showErrorMsg;
  final Color textColor;
  const _MesssageCompoenet({
    Key? key,
    required this.errorMsg,
    required this.showErrorMsg,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            errorMsg,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            showErrorMsg
                ? Icons.highlight_remove
                : Icons.check_circle_outline,
            color: showErrorMsg
                ? ColorConstant.kRedColor
                : ColorConstant.kGreenColor,
          ),
        ),
      ],
    );
  }
}

