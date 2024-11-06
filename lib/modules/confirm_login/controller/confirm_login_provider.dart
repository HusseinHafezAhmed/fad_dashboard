import 'package:fad_dashboard/modules/confirm_login/api/confirm_login_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data_access_layer/sharedpref_constants.dart';
import '../../../GUI/dashboard.dart';

class ConfirmLoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinCodeController = TextEditingController();

  bool isFetching = false;

  static String? userType;
  static String? userName;
  Future<void> confirmLogin(context, String email) async {
    Map<String, dynamic> confirmLoginData = {
      "email": email,
      "code": int.parse(pinCodeController.text)
    };
    Map? response;
    isFetching = true;
    notifyListeners();
    response = await ConfirmLoginApi().confirmLogin(confirmLoginData);
    isFetching = false;
    notifyListeners();
    bool status = response['status'];
    if (status) {
      (await SharedPreferences.getInstance()).setString(
          SharedPrefConstants.accessToken,
          "Bearer ${response['data']['access_token']}");
      (await SharedPreferences.getInstance()).setString(
          SharedPrefConstants.userName, response['data']['userName']);
      (await SharedPreferences.getInstance()).setString(
          SharedPrefConstants.userId, response['data']['userId'].toString());
      (await SharedPreferences.getInstance()).setString(
          SharedPrefConstants.userType, response['data']['userType']);

      userType = response['data']['userType'].toString();
      userName = response['data']['userName'].toString();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (
            BuildContext context,
          ) =>
                  DashboardScreen(userType: userType)),
          (Route<dynamic> route) => false);
    }
    notifyListeners();
  }
}
