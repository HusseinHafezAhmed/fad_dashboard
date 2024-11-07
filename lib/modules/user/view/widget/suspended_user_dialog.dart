import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/my_colors.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text.dart';
import '../../controller/user_provider.dart';
import '../../model/users.dart';

class SuspendedUserDialog extends StatelessWidget {
  final int index;
  final Users user;
  const SuspendedUserDialog(
      {super.key, required this.index, required this.user});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider.suspend(),
      child: Consumer<UserProvider>(
        builder: (_, UserProvider myProvider, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        //     key: formGlobalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.drawText(
                              content: user.isSuspended!
                                  ? "UnSuspened User"
                                  : "Suspend User",
                              bold: true,
                              fontSize: 20,
                              fontColor: MyColors.lightBlackColor,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: MyText.drawText(
                                  content:
                                      'Are you sure you want to ${user.isSuspended! ? "unsuspend" : "suspend"} this user?',
                                  fontColor: MyColors.lightBlackColor,
                                  bold: true,
                                  fontSize: 18,
                                  centered: true),
                            ),
                            // Directionality(
                            //   textDirection: TextDirection.ltr,
                            //   child: SizedBox(
                            //     width: 500,

                            //     child: getUserTextInputField(
                            //       content: "Reason",
                            //       fontSize: 15,
                            //       controller: myProvider
                            //           .reasonController,
                            //       validatorFunction: validateLoginInput,
                            //       autoValidationMode:
                            //           AutovalidateMode.disabled,
                            //       fontColor: MyColors.darkGreyColor,
                            //       keyboardType: TextInputType.text,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: AppButton(
                                    key: const Key('desktop'),
                                    color: MyColors.greyColor,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    buttonText: 'Cancel',
                                    textColor: MyColors.whiteColor,

                                    textSize: 15,
                                    height: 40,
                                    width: 160,
                                  ),
                                ),
                                Flexible(
                                  child: AppButton(
                                    key: const Key('desktop'),
                                    color: MyColors.sideMenuColor,
                                    onPressed: () async {
                                      user.isSuspended!
                                          ? await myProvider
                                              .suspendedUser(index, false)
                                              .then((value) =>
                                                  Navigator.pop(context))
                                          : await myProvider
                                              .suspendedUser(index, true)
                                              .then((value) =>
                                                  Navigator.pop(context));
                                    },
                                    buttonText: user.isSuspended!
                                        ? "UnSuspend"
                                        : 'Suspend',
                                    textColor: MyColors.whiteColor,

                                    textSize: 15,
                                    height: 40,
                                    width: 160,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
