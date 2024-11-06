// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../constant/my_colors.dart';
import 'image.dart';
import 'text.dart';

class DrawerTile extends StatefulWidget {
  const DrawerTile(
      {Key? key,
      this.title,
      this.icon,
      this.onTap,
      this.myProvider,
      this.index})
      : super(key: key);
  final String? title, icon;
  final VoidCallback? onTap;
  final index;
  final myProvider;

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.myProvider.tabIndex == widget.index
          ?  MyColors.whiteColor.withOpacity(.25)
          : Colors.transparent,
          borderRadius: BorderRadius.circular(6)
      ),
      
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onTap: widget.onTap,
        horizontalTitleGap: 4,
        leading: MyImage.drawImage(
          widget.icon!,
          color: MyColors.whiteColor,
          height: 17,
          width: 17,
        ),
        title: MyText.drawText(
            content: widget.title!,
            fontColor: MyColors.whiteColor,
            fontSize: 14,
            bold: false),
      ),
    );
  }
}
