import 'package:fad_dashboard/core/constant/my_colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
    @required this.width,
    this.height
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;

    return Transform.scale(
      scale: 1.04,
      child: Container(
        width: width,
        height: height??fullHeight,
        decoration:  BoxDecoration(
          color: MyColors.bgColor,
           ),
        child: Image.asset("assets/images/fad_logo.png",scale: .5,),
      ),
    );
  }
}