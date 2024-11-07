import 'package:fad_dashboard/core/constant/my_colors.dart';
import 'package:fad_dashboard/core/validation/validation.dart';
import 'package:fad_dashboard/core/widget/text.dart';
import 'package:fad_dashboard/modules/user/controller/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/button.dart';

// ignore: must_be_immutable
class FilterDialog extends StatelessWidget with InputValidation {
  FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider.filter(),
      child: Consumer(
        builder: (_, UserProvider myProvider, ch) => Scaffold(
          backgroundColor: MyColors.bgColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText.drawText(
                        content: 'Filter',
                        bold: true,
                        fontColor: MyColors.lightBlackColor,
                        fontSize: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SizedBox(
                                width: 280,
                                child: getUserTextInputField(
                                  content: "User Name",
                                  fontSize: 15,
                                  controller: myProvider.nameController,
                                  //validatorFunction: validateName,
                                  autoValidationMode: AutovalidateMode.disabled,
                                  fontColor: MyColors.darkGreyColor,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SizedBox(
                                width: 280,
                                child: getUserTextInputField(
                                  content: "User Email",
                                  fontSize: 15,
                                  controller: myProvider.emailController,
                                  //validatorFunction: validateEmail,
                                  autoValidationMode: AutovalidateMode.disabled,
                                  fontColor: MyColors.darkGreyColor,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: SizedBox(
                                width: 280,
                                child: getUserTextInputField(
                                  content: "Passport No",
                                  fontSize: 15,
                                  controller: myProvider.passportNoController,
                                  autoValidationMode: AutovalidateMode.disabled,
                                  fontColor: MyColors.darkGreyColor,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AppButton(
                            key: const Key('desktop'),
                            color: MyColors.greyColor,
                            onPressed: () {
                              Navigator.pop(context, {
                                "registrationNo": null,
                                "PassportNo": null,
                                "phoneNumber": null,
                                "email": null,
                                "userName": null,
                                "userId": null,
                                "createDateTimeFrom":
                                    "1970-11-06T13:53:36.982Z",
                                "createDateTimeTo":
                                    DateTime.now().toIso8601String()
                              });
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
                            onPressed: () {
                              Navigator.pop(context, {
                                "registrationNo": null,
                                "PassportNo":
                                    myProvider.passportNoController.text,
                                "phoneNumber": null,
                                "email": myProvider.emailController.text,
                                "userName": myProvider.nameController.text,
                                "userId": null,
                                "createDateTimeFrom":
                                    "1970-11-06T13:53:36.982Z",
                                "createDateTimeTo":
                                    DateTime.now().toIso8601String()
                              });
                            },
                            buttonText: "Filter",
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
          ),
        ),
      ),
    );
  }
}
