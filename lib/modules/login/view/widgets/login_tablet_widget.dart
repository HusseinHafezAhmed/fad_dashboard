import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/my_colors.dart';
import '../../../../core/validation/validation.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text.dart';
import '../../controller/login_provider.dart';
import 'welcome_screen.dart';

class LoginTabletWidget extends StatefulWidget {
  const LoginTabletWidget({super.key});

  @override
  State<LoginTabletWidget> createState() => _LoginTabletWidgetState();
}

class _LoginTabletWidgetState extends State<LoginTabletWidget>
    with InputValidation {
  final formGlobalKey = GlobalKey<FormState>();
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
    return Consumer<LoginProvider>(
        builder: (_, LoginProvider myProvider, child) {
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
                      margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: Form(
                        key: formGlobalKey,
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

                            ///username
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: RawKeyboardListener(
                                focusNode: _emailFocus!,
                                onKey: (key) {
                                  RawKeyEventDataWeb kData =
                                      key.data as RawKeyEventDataWeb;
                                  if (kData.code == 'Tab') {
                                    FocusScope.of(context)
                                        .requestFocus(_passwordFocus);
                                  }
                                },
                                child: TextFormField(
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(_passwordFocus),
                                  onChanged: (text) {
                                    if (text.contains('\t')) {
                                      text = text.replaceAll('\t', '');
                                      FocusScope.of(context)
                                          .requestFocus(_passwordFocus);
                                    }
                                  },
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  cursorColor: MyColors.primaryColor,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.primaryColor)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MyColors.hintGreyColor),
                                    ),
                                    labelText: 'User Email',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: "The-Sans-Plain",
                                    ),
                                  ),
                                  validator: validateLoginInput,
                                  textInputAction: TextInputAction.done,
                                  controller: myProvider.loginEmailController,
                                  style: TextStyle(
                                    color: MyColors.lightBlackColor,
                                    fontSize: 15.0,
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            ///password
                            Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextFormField(
                                  onEditingComplete: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      myProvider.login(context);
                                    }
                                  },
                                  focusNode: _passwordFocus,
                                  cursorColor: MyColors.primaryColor,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10.0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.primaryColor)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MyColors.hintGreyColor),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: "The-Sans-Plain",
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        myProvider.loginShowPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: const Color(0xff30332E),
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            myProvider.loginShowPassword =
                                                !myProvider.loginShowPassword;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  validator: validateLoginInput,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: myProvider.loginShowPassword,
                                  controller:
                                      myProvider.loginPasswordController,
                                  style: TextStyle(
                                    color: MyColors.lightBlackColor,
                                    fontSize: 15.0,
                                  ),
                                )),
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
                                    onPressed: () {
                                      if (formGlobalKey.currentState!
                                          .validate()) {
                                        myProvider.login(context);
                                      }
                                    },
                                    buttonText: 'Login',
                                    textColor: MyColors.whiteColor,
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
