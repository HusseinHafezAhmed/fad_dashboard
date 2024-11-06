import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/my_colors.dart';

class MyToast {
  MyToast(message,
      {double? fontSize,
      Color? fontColor,
      Color? background,
      String webBgColor = "#F13C15"}) {
    Fluttertoast.showToast(
        webBgColor: webBgColor,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 15,
        msg: message.toString(),
        fontSize: fontSize ?? 16,
        textColor: Colors.white,
        backgroundColor: MyColors.primaryColor);
  }
}
