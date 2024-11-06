
import 'package:flutter/material.dart';

import '../constant/my_colors.dart';
import 'text.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        color: Colors.grey[100],
        width: double.infinity,
        child: Center(
          child: Column(children: [
            MyText.drawText(
                content: '2022 © All rights reserved.',
                fontSize: 14,
                fontColor: MyColors.greyColor),
            const SizedBox(
              height: 10,
            ),
            MyText.drawText(
                content: 'Designed and developed by DAF.',
                fontSize: 14,
                fontColor: MyColors.greyColor),
          ]),
        ),
      ),
    );
  }
}
