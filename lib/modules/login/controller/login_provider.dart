// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:fad_dashboard/modules/confirm_login/view/confirm_login_screen.dart';
import 'package:flutter/material.dart';

import '../Api/login_api.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool loginNoFocus = false;
  bool loginPasswordFocus = false;
  bool loginShowPassword = true;
  bool loginPassEnableText = true;
  FocusNode passwordFocusNode = FocusNode();
  Color passwordColor = Colors.grey;
  bool isFetching = false;

  static String? userType;
  static String? userName;
  Future<void> login(context) async {
    Map<String, dynamic> loginData = {
      "email": loginEmailController.text,
      "password": loginPasswordController.text
    };
    Map? response;
    isFetching = true;
    notifyListeners();
    response = await LoginApi().login(loginData);
    isFetching = false;
    notifyListeners();
    bool status = response['status'];
    bool data = response['data'];
    if (status && data) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (
            BuildContext context,
          ) =>
                  ConfirmLoginScreen(email: loginEmailController.text,)),
          (Route<dynamic> route) => false);
    }
    notifyListeners();
  }
}
