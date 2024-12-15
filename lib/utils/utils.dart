

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/colors.dart';

class Utils{


  static void fieldFocusChanged(BuildContext context, FocusNode current, FocusNode nextFocus){

    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  // static toastMessage(String message){
  //
  //   Fluttertoast.showToast(msg: message,
  //   backgroundColor: AppColor.blackColor,
  //       gravity: ToastGravity.BOTTOM
  //   );
  // }

  static snackBar(String title, String message) {
    Get.snackbar(
      backgroundColor: AppColor.appbarColor,
      colorText: AppColor.secondaryColor,
      title,
      message,
    );
  }
}