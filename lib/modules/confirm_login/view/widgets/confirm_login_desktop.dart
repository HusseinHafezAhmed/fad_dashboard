import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/my_colors.dart';
import '../../../../core/validation/validation.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text.dart';
import '../../../login/view/widgets/welcome_screen.dart';
import '../../controller/confirm_login_provider.dart';

class ConfirmLoginDesktopWidget extends StatefulWidget {
  final String email;

  const ConfirmLoginDesktopWidget({super.key, required this.email});

  @override
  State<ConfirmLoginDesktopWidget> createState() =>
      _ConfirmLoginDesktopWidgetState();
}

class _ConfirmLoginDesktopWidgetState extends State<ConfirmLoginDesktopWidget>
    with InputValidation {
  FocusNode? _emailFocus;
  FocusNode? _passwordFocus;

  @override
  void initState() {
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus!.dispose();
    _passwordFocus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<ConfirmLoginProvider>(
        builder: (_, ConfirmLoginProvider myProvider, child) {
      return Scaffold(
        backgroundColor: MyColors.bgColor,
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(children: [
              Flexible(
                flex: 3,
                child: WelcomeScreen(width: width),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(200, 00, 200, 00),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText.drawText(
                              content: 'Federation of Arab Dentists',
                              fontSize: 28,
                              fontColor: Colors.black,
                              bold: true),
                          const SizedBox(
                            height: 30,
                          ),
                          MyText.drawText(
                              content: 'Login to the system',
                              fontSize: 18,
                              fontColor: MyColors.titleGreyColor,
                              bold: true),
                          const SizedBox(
                            height: 50,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Form(
                              key: myProvider.formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 20,
                                ),
                                child: PinCodeTextField(
                                  appContext: context,
                                  pastedTextStyle: TextStyle(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textStyle:
                                      TextStyle(color: MyColors.blueColor),
                                  length: 4,
                                  obscureText: false,
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    if (v!.length < 3) {
                                      return "pin code can't be less than 4 numbers";
                                    } else {
                                      return null;
                                    }
                                  },
                                  pinTheme: PinTheme(
                                    activeColor: MyColors.whiteColor,
                                    inactiveColor: MyColors.whiteColor,
                                    selectedFillColor: MyColors.whiteColor,
                                    selectedColor: MyColors.lightGreen,
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 60,
                                    fieldWidth: 50,
                                    activeFillColor: MyColors.whiteColor,
                                    inactiveFillColor: MyColors.whiteColor,
                                  ),
                                  cursorColor: MyColors.blueColor,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  enableActiveFill: true,
                                  controller: myProvider.pinCodeController,
                                  keyboardType: TextInputType.number,
                                  boxShadows: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          const SizedBox(
                            height: 50,
                          ),
                          myProvider.isFetching
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: MyColors.primaryColor,
                                  ),
                                )
                              : AppButton(
                                  color: MyColors.blueColor,
                                  onPressed: () {
                                    if (myProvider.formKey.currentState!
                                        .validate()) {
                                      myProvider.confirmLogin(
                                          context, widget.email);
                                    }
                                  },
                                  buttonText: 'Login',
                                  textSize: 18,
                                  height: 50,
                                  width: double.infinity,
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Center(
                          //     child: MyImage.drawImage(
                          //         'assets/images/daf_logo.png',
                          //         width: 80,
                          //         height: 60)),
                          const SizedBox(
                            height: 50,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: MyText.drawText(
                                content: '2024 © All rights reserved.',
                                fontSize: 12,
                                fontColor: MyColors.copyRightGreyColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: MyText.drawText(
                                content: 'Designed and developed by DAF.',
                                fontSize: 12,
                                fontColor: MyColors.copyRightGreyColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
