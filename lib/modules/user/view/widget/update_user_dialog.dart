import 'package:fad_dashboard/core/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/my_colors.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text.dart';
import '../../controller/user_provider.dart';
import '../../model/users.dart';

class UpdateUserDialog extends StatelessWidget with InputValidation {
  final int index;
  final Users user;
  UpdateUserDialog({super.key, required this.index, required this.user});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider.update(user),
      child: Consumer<UserProvider>(
        builder: (_, UserProvider myProvider, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: myProvider.updateFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.drawText(
                              content: "Update User",
                              bold: true,
                              fontSize: 20,
                              fontColor: MyColors.lightBlackColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: SizedBox(
                                    width: 500,
                                    child: getUserTextInputField(
                                      content: "User Email",
                                      fontSize: 15,
                                      controller:
                                          myProvider.emailController,
                                      validatorFunction: validateEmail,
                                      autoValidationMode:
                                          AutovalidateMode.disabled,
                                      fontColor: MyColors.darkGreyColor,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: SizedBox(
                                    width: 500,
                                    child: getUserTextInputField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .allow(RegExp("[0-9]+")),
                                      ],
                                      content: "User Phone",
                                      fontSize: 15,
                                      controller: myProvider
                                          .phoneNumberController,
                                      validatorFunction:
                                          validatePhoneNumber,
                                      autoValidationMode:
                                          AutovalidateMode.disabled,
                                      fontColor: MyColors.darkGreyColor,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: AppButton(
                                    key: const Key('desktop'),
                                    color: MyColors.greyColor,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    buttonText: 'Cancel',
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
                                      await myProvider
                                          .updateUser(index)
                                          .then((value) =>
                                              Navigator.pop(context));
                                    },
                                    buttonText: 'Update',
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
