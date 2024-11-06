// ignore_for_file: must_be_immutable, no_logic_in_create_state, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/my_colors.dart';

class MyButton {
  ///-------------------(author Madkour)
  static drawDesign(
      {onPressed,
      widget,
      text,
      context,
      onLongPress,
      color,
      padding = const EdgeInsets.all(5.0),
      width}) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(
            MaterialState.pressed,
          )) return 2;
          return 0.25;
        }),
        shadowColor: MaterialStateProperty.all(const Color(0xff4c6A37)),
        alignment: AlignmentDirectional.center,
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
          if (states.contains(
            MaterialState.pressed,
          )) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            );
          }
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          );
        }),
      ),
      onPressed: onPressed,
      child: widget ??
          SizedBox(
            width: width ?? (MediaQuery.of(context).size.width / 1.5),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: color ?? Colors.white,
                  fontFamily: "The-Sans-Plain",
                  fontSize: 21),
            )),
          ),
    );
  }
}

class AppButton extends StatefulWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? textSize;
  final String? buttonText;
  final Color? textColor;
  final String? icon;
  final Color? iconColor;
  MaterialStateProperty? mt;

  ///for Add to Cart button in Products card
  final bool? isIcon;

  final VoidCallback? onPressed;

  AppButton({
    Key? key,
    this.color,
    this.height,
    this.width,
    this.icon,
    this.textSize,
    this.buttonText,
    this.textColor,
    this.isIcon,
    this.iconColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState(
      color: color ?? MyColors.blueColor,
      height: height ?? 60,
      width: width ?? 400,
      textSize: textSize ?? 13,
      buttonText: buttonText ?? '',
      textColor: textColor ?? Colors.white,
      isIcon: isIcon ?? false,
      icon: icon,
      iconColor: iconColor ?? MyColors.primaryColor,
      onPressed: onPressed);
}

class _AppButtonState extends State<AppButton> {
  Color? color = MyColors.blueColor;
  double? height;
  double? width;
  double? textSize;
  String? buttonText;
  Color? textColor;
  String? icon;
  Color? iconColor = MyColors.primaryColor;
  bool? isIcon = false;

  final VoidCallback? onPressed;
  _AppButtonState({
    this.color,
    this.height,
    this.width,
    this.textSize,
    this.buttonText,
    this.textColor,
    this.icon,
    this.iconColor,
    this.isIcon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? height,
      width: width ?? width,
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: .5,
            color: isIcon! ? MyColors.borderButtonColor : Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIcon!)
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 5.0, top: 5),
                child: icon!.toLowerCase().endsWith(".svg")
                    ? SvgPicture.asset(
                        icon!,
                        width: 20,
                        height: 20,
                        color: iconColor,
                      )
                    : Image.asset(
                        icon!,
                        width: 20,
                        height: 20,
                        color: iconColor,
                      ),
              ),
            Flexible(
              child: Text(
                buttonText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "The-Sans-Plain",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
