import 'package:flutter/material.dart';

class MyText {
  static Text drawText(
      {String content = "Test",
      double fontSize = 12,
      int maxlines = 3,
      Color fontColor = Colors.black26,
      String fontFamily = "The-Sans-Plain",
      bool bold = false,
      bool centered = false}) {
    return Text(
      content,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
      ),
      maxLines: maxlines,
      
      textAlign: centered ? TextAlign.center : TextAlign.start,
    );
  }

  static SelectableText drawSelectableText(
      {String content = "Test",
      double fontSize = 12,
      Color fontColor = Colors.black26,
      bool bold = false,
      bool centered = false}) {
    return SelectableText(
      content,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: "The-Sans-Plain",
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: centered ? TextAlign.center : TextAlign.start,
    );
  }
}
