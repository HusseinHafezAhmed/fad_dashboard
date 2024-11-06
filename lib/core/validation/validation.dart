// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/my_colors.dart';
import '../widget/text.dart';

mixin InputValidation {
  //----------------------------------------------------(Regex)
  /// name & password validation
  RegExp upperCaseRegex = RegExp(r'[A-Z]');
  RegExp lowerCaseRegex = RegExp(r'[a-z]');
  RegExp containNumberRegex = RegExp(r'[0-9]');
  RegExp containdoubleNumberRegex =
      RegExp("^[-+]?[0-9]+(,[0-9]{3})*([0-9]+)?([eE][-+]?[0-9]+)?");

  RegExp numbersAndLettersRegex = RegExp("^[a-zA-Z0-9]*\$");
  RegExp speciealCaracterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  /// email validation
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  /// phone number validation
  RegExp phoneNumberRegex = RegExp(r'^(?:[0][1][0125])[0-9]{8}$');

  //----------------------------------------------------(Flags)
  /// password recovery validation
  bool isCount = false;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isNumbers = false;

  //----------------------------------------------------(methods)
  ///Sign in validation Functions
  String? validateName(String? name) {
    if (name!.contains('<') ||
        name.contains('>') ||
        name.contains('(') ||
        name.contains(')')) {
      return "You cant use '< > ( )'";
    }

    if (name.isEmpty) {
      return ("Name is required");
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email!.contains('<') ||
        email.contains('>') ||
        email.contains('(') ||
        email.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (email.isEmpty) {
      return "Email can't be empty";
    }
    if (!emailRegex.hasMatch(email)) {
      return "Email is not valid";
    }
    return null;
  }

  String? validateSyndNumber(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containNumberRegex.hasMatch(number) && number.isNotEmpty) {
      return 'Enter numbers only';
    }
    if (number.length > 20) {
      return '20 numbers max';
    }
    return null;
  }

  String? validateNationalId(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containNumberRegex.hasMatch(number) && number.isNotEmpty) {
      return 'Enter numbers only';
    }
    if (number.length < 14) {
      return '14 numbers min';
    }
    if (number.length > 14) {
      return '14 numbers max';
    }
    return null;
  }

  String? validateLongID(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containNumberRegex.hasMatch(number) && number.isNotEmpty) {
      return 'Enter numbers only';
    }
    if (number.length > 41) {
      return '40 numbers max';
    }
    return null;
  }

  String? validateFilterPhoneNumber(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!phoneNumberRegex.hasMatch(number) && number.isNotEmpty) {
      return ("Invalid Mobile number");
    }
    if (number.length > 12) {
      return '11 numbers max';
    }
    return null;
  }

  String? validateFilterEmail(String? email) {
    if (email!.contains('<') ||
        email.contains('>') ||
        email.contains('(') ||
        email.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!emailRegex.hasMatch(email) && email.isNotEmpty) {
      return "Email is not valid";
    }
    return null;
  }

  String replaceEnglishNumber(String? input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input!.replaceAll(english[i], arabic[i]);
    }
    return input!;
  }

  String? replaceArabicNumber(String? input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < arabic.length; i++) {
      input = input!.replaceAll(arabic[i], english[i]);
    }
    //print("$input");
    return input;
  }

  String? validateFilterText(String? text) {
    if (text!.contains('<') ||
        text.contains('>') ||
        text.contains('(') ||
        text.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (text.length > 50) {
      return "50 letters max";
    }
    return null;
  }

  String? validateText(String? text) {
    if (text!.contains('<') ||
        text.contains('>') ||
        text.contains('(') ||
        text.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (text.length > 10) {
      return "10 letters max";
    }
    if (text.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  String? validateNotEmpty(String? text) {
    if (text!.contains('<') ||
        text.contains('>') ||
        text.contains('(') ||
        text.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (text.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.contains('<') ||
        password.contains('>') ||
        password.contains('(') ||
        password.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (password.isEmpty) {
      return "password can't be empty";
    }

    if (!password.contains(containNumberRegex)) {
      return ("Name must contain Numbers");
    }
    if (!password.contains(lowerCaseRegex)) {
      return ("Name must contain Lowercase letter");
    }
    if (!password.contains(speciealCaracterRegex)) {
      return ("Name must contain Special letter");
    }
    if (password.length < 8) {
      return "Password must be 8 characters at least";
    }
    if (password.length > 20) {
      return "Password can't be more than 20 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return "Passwords don't match!";
    }
    return null;
  }

  /// Login Validation Functions
  String? validateLoginInput(String? value) {
    if (value!.contains('<') ||
        value.contains('>') ||
        value.contains('(') ||
        value.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (value.isEmpty) {
      return "Can't be Empty";
    }

    return null;
  }

  /// password recovery onChange function
  void updateCheckBox(String? password) {
    if (password!.length >= 8) {
      isCount = true;
    } else {
      isCount = false;
    }
    if (password.contains(upperCaseRegex)) {
      isUpperCase = true;
    } else {
      isUpperCase = false;
    }
    if (password.contains(lowerCaseRegex)) {
      isLowerCase = true;
    } else {
      isLowerCase = false;
    }
    if (password.contains(containNumberRegex)) {
      isNumbers = true;
    } else {
      isNumbers = false;
    }
  }

  /// validator Function for Password recovery checkbox
  String? validateCheckbox(String? password) {
    if (isCount && isUpperCase && isLowerCase && isNumbers) {
      return null;
    } else {
      return " ";
    }
  }

  /// validator Function for verification code
  String? validateCodeNumber(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containNumberRegex.hasMatch(number)) {
      return "Enter Numbers only";
    }
    if (number.length < 6) {
      return "Invalid Code";
    }
    return null;
  }

  String? validateNumber(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containdoubleNumberRegex.hasMatch(number)) {
      return "Enter Numbers only";
    }
    if (number.length > 10) {
      return "Invalid number";
    }
    return null;
  }

  String? validateNumberOrEmpty(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containdoubleNumberRegex.hasMatch(number) && number.isNotEmpty) {
      return "Enter Numbers only";
    }

    return null;
  }

  ///validator function for all phone numbers
  ///used in booking validation screen
  String? validatePhoneNumber(String? number) {
    if (number!.contains('<') ||
        number.contains('>') ||
        number.contains('(') ||
        number.contains(')')) {
      return "You cant use '< > ( )'";
    }
    if (!containNumberRegex.hasMatch(number)) {
      return "Please enter Numbers only";
    }
    if (number.isEmpty) {
      return "Please enter your number";
    }
    return null;
  }

  //----------------------------------------------------(Text Form field )

  /// customized TextFormField
  Widget getTextInputField(
      {String content = '',
      String? hintText,
      String? labelText,
      double fontSize = 14.0,
      double hintFontSize = 15.0,
      Color? fontColor,
      Color? hintFontColor,
      TextInputType keyboardType = TextInputType.text,
      bool isPasswordField = false,
      TextEditingController? controller,
      Function? validatorFunction,
      Widget? iconButtonWidget,
      Function? onChanged,
      Color? borderColor,
      bool readOnly = false,
      TextInputAction? textInputAction,
      AutovalidateMode? autoValidationMode,
      bool rtl = false}) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// text field title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: MyText.drawText(
                content: content,
                fontSize: fontSize,
                fontColor: fontColor ?? MyColors.darkGreyColor,
                bold: true,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: borderColor ?? MyColors.primaryColor,
              border: Border.all(width: 1, color: MyColors.borderGreyColor)),
          height: 50,
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: TextFormField(
            /// text filed functionality
            textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            autovalidateMode:
                autoValidationMode ?? AutovalidateMode.onUserInteraction,
            controller: controller,
            obscureText: isPasswordField,
            keyboardType: keyboardType,
            validator: validatorFunction as String? Function(String?)?,
            onChanged: onChanged as String? Function(String?)?,
            textInputAction: textInputAction,
            readOnly: readOnly,
            textAlign: TextAlign.center,

            /// text field style
            cursorColor: MyColors.primaryColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor ?? MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor ?? MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor ?? MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor ?? MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: borderColor ?? MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: labelText == null ? 19 : 11, horizontal: 12.0),

                /// Label Text
                labelText: labelText,
                labelStyle: TextStyle(
                  color: hintFontColor ?? MyColors.greyColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "The-Sans-Plain",
                ),

                /// Hint text
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintFontColor ?? MyColors.greyColor,
                  fontSize: hintFontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: "The-Sans-Plain",
                ),
                fillColor: Colors.white,
                filled: true,

                /// for password field visibility
                suffixIcon: iconButtonWidget,
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 20, maxWidth: 20)

                // icon: iconButtonWidget
                ),
          ),
        ),
      ],
    );
  }

  Widget getUserTextInputField(
      {String content = '',
      String? hintText,
      String? labelText,
      double fontSize = 14.0,
      double hintFontSize = 15.0,
      int maxLines = 1,
      Color? fontColor,
      Color? hintFontColor,
      TextInputType keyboardType = TextInputType.text,
      bool isPasswordField = false,
      TextEditingController? controller,
      List<TextInputFormatter>? inputFormatters,
      Function? validatorFunction,
      Widget? iconButtonWidget,
      Function? onChanged,
      TextInputAction? textInputAction,
      AutovalidateMode? autoValidationMode,
      bool? readonly,
      bool rtl = false}) {
    return Column(
      children: [
        /// text field title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: MyText.drawText(
                content: content,
                fontSize: fontSize,
                fontColor: fontColor ?? MyColors.darkGreyColor,
                bold: true,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          /// text filed functionality
          maxLines: maxLines,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          autovalidateMode:
              autoValidationMode ?? AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: isPasswordField,
          keyboardType: keyboardType,
          validator: validatorFunction as String? Function(String?)?,
          onChanged: onChanged as String? Function(String?)?,
          textInputAction: textInputAction,
          readOnly: readonly ?? false,
          inputFormatters: inputFormatters,
          
          /// text field style
          cursorColor: MyColors.primaryColor,

          decoration: InputDecoration(
            hoverColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: labelText == null ? 19 : 11, horizontal: 12.0),

            /// Label Text
            labelText: labelText,
            labelStyle: TextStyle(
              color: hintFontColor ?? MyColors.greyColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              fontFamily: "The-Sans-Plain",
            ),

            /// Hint text
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintFontColor ?? MyColors.greyColor,
              fontSize: hintFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: "The-Sans-Plain",
            ),
            fillColor: Colors.white,
            filled: true,

            /// for password field visibility
            suffixIcon: iconButtonWidget,
          ),
        ),
      ],
    );
  }

  Widget getSearchTextInputField(
      {String content = '',
      String? hintText,
      String? labelText,
      double fontSize = 14.0,
      double hintFontSize = 15.0,
      int maxLines = 1,
      Color? fontColor,
      Color? hintFontColor,
      TextInputType keyboardType = TextInputType.text,
      bool isPasswordField = false,
      TextEditingController? controller,
      Function? validatorFunction,
      Widget? iconButtonWidget,
      Function? onChanged,
      TextInputAction? textInputAction,
      AutovalidateMode? autoValidationMode,
      bool? readonly,
      List<TextInputFormatter>? inputFormatters,
      bool rtl = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom:5.0),
      child: Column(
        children: [
          /// text field title
          if (content != '')
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: MyText.drawText(
                    content: content,
                    fontSize: fontSize,
                    fontColor: fontColor ?? MyColors.darkGreyColor,
                    bold: true,
                  ),
                ),
              ],
            ),
          if (content != '')
            const SizedBox(
              height: 10,
            ),
          TextFormField(
            inputFormatters: inputFormatters,
            /// text filed functionality
            maxLines: maxLines,
            textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            autovalidateMode:
                autoValidationMode ?? AutovalidateMode.onUserInteraction,
            controller: controller,
            obscureText: isPasswordField,
            keyboardType: keyboardType,
            validator: validatorFunction as String? Function(String?)?,
            onChanged: onChanged as String? Function(String?)?,
            textInputAction: textInputAction,
            readOnly: readonly ?? false,
    
            /// text field style
            cursorColor: MyColors.primaryColor,
    
            decoration: InputDecoration(
              
              hoverColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
                borderRadius: BorderRadius.circular(6),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
                borderRadius: BorderRadius.circular(6),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
                borderRadius: BorderRadius.circular(6),
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: labelText == null ? 19 : 11, horizontal: 12.0),
                
              /// Label Text
              labelText: labelText,
              labelStyle: TextStyle(
                color: hintFontColor ?? MyColors.greyColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: "The-Sans-Plain",
              ),
    
              /// Hint text
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintFontColor ?? MyColors.greyColor,
                fontSize: hintFontSize,
                fontWeight: FontWeight.w800,
                fontFamily: "The-Sans-Plain",
              ),
              fillColor: Colors.white,
              filled: true,
              
              /// for password field visibility
              suffixIcon: iconButtonWidget,
            ),
          ),
          
        ],
        
      ),
    );
  }

  Widget TextInputField({
    String? content = '',
    String? hintText,
    String? labelText,
    double fontSize = 14.0,
    double hintFontSize = 15.0,
    Color? fontColor,
    Color? hintFontColor,
    TextInputType keyboardType = TextInputType.text,
    bool isPasswordField = false,
    TextEditingController? controller,
    Function? validatorFunction,
    Widget? iconButtonWidget,
    Function? onChanged,
    TextInputAction? textInputAction,
    AutovalidateMode? autoValidationMode,
  }) {
    return TextFormField(
        textDirection: TextDirection.rtl,
        cursorColor: MyColors.primaryColor,
        autofocus: false,
        style: const TextStyle(
          color: Colors.black,
        ),
        keyboardType: keyboardType,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.primaryColor)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.hintGreyColor),
          ),
          suffixIcon: (isPasswordField)
              ? IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: MyColors.hintGreyColor,
                  ),
                  onPressed: onChanged as void Function()?,
                )
              : null,
        ));
  }

  Widget getUserData({
    String content = '',
    String? data,
    double fontSize = 14.0,
    Color? fontColor,
    Color? dataFontColor,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// text field title
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyText.drawText(
                content: content,
                fontSize: fontSize,
                fontColor: fontColor!,
                bold: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: MyText.drawText(
                    content: data!,
                    fontSize: fontSize,
                    fontColor: dataFontColor!,
                    bold: false),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
