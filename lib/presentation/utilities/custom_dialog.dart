
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../custom_widgets/custom_dialog_widget.dart';
import 'color_constant.dart';

mixin CustomDialog{

  final FToast _fToast = FToast();

  void floatingDialog(
      String message,
      BuildContext context, {
        int seconds = 7,
        bool isErrorMessage = false,
        ToastGravity messagePosition = ToastGravity.TOP,
      }){

    _fToast.init(context);
    _fToast.showToast(
      child: CustomDialogWidget(
        message: message,
        showErrorMessage: isErrorMessage,
      ),
      toastDuration: Duration(
        seconds: seconds,
      ),
      gravity: messagePosition,
    );

  }

  void appCloseConfirmationDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(MediaQuery.of(context).size.width>600){
      width = 500;
    }
    if(Platform.isAndroid){
      showDialog(
        context: context,
        builder: (dialogContext){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  width: width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: ColorConstant.kWhiteColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConstant.kPrimaryColor,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // To make the card compact
                    children: <Widget>[
                      const Text(
                        'Confirmation',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Are you sure you want to exit?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 36.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(dialogContext),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  "NO",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                                SystemNavigator.pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  "YES",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }


}