import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data_access_layer/sharedpref_constants.dart';

class MainProvider extends ChangeNotifier {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int? tabIndex = 1;
  void changeTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  MainProvider() {
    getUserType();
  }
  String? userType;
  String? userName;
  getUserType() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userType = sharedPreferences.getString(SharedPrefConstants.userType);
    userName = sharedPreferences.getString(SharedPrefConstants.userName);
  }

  void updateUI() {
    notifyListeners();
  }
}
