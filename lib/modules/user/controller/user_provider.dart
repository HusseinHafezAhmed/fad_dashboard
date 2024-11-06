// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../core/services/navigation_service.dart';
import '../../../core/widget/toast.dart';
import '../../../locator.dart';
import '../../../routing/route_names.dart';
import '../Api/get_users_api.dart';
import '../Api/suspend_user_api.dart';
import '../Api/update_user_api.dart';
import '../model/users.dart';
import '../view/widget/users_table.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUsers(0, rowCount!.toInt());
  }
  UserProvider.update(Users user) {
    phoneNumberController.text = user.phoneNumber!.substring(2);
    emailController.text = user.email!;
  }
  UserProvider.suspend();

  double? rowCount = 10;
  int? selected = 0;
  int? takes;
  int? skips;
  int? total = 1;
  int? length = 1;
  int? counter = 0;
  bool isTableFetching = false;
  static List<Users> users = <Users>[];
  UsersDataSource? usersDataSource = UsersDataSource(userData: [], total: 0);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  Future<void> getUsers(
    int skip,
    int take,
  ) async {
    takes = take;
    skips = skip;
    users = [];
    isTableFetching = true;
    notifyListeners();
    Map response = await GetUsersApi().getUsers(take, skip);
    var status = response['status'];
    var data = response['data']['users'];
    total = response['data']['count'];
    isTableFetching = false;
    notifyListeners();
    if (status) {
      data.forEach((v) {
        users.add(Users.fromJson(v));
      });
      length = users.length;
      notifyListeners();
      usersDataSource = UsersDataSource(userData: users, total: total);
    }
    notifyListeners();
  }

  Future<void> updateUser(ind) async {
    int id = int.parse(users[ind].id.toString());
    Map<String, dynamic> data = {
      "id": id,
      "phoneNumber": "+2${phoneNumberController.text.trim()}",
      "email": emailController.text.trim()
    };
    Map response = await UpdateUserApi().update(data);
    var status = response['status'];
    String message = response['message'].toString();
    if (status) {
    locator<NavigationService>().navigateTo(userRoute);
      MyToast(message, webBgColor: "#828FA8");
    }
    notifyListeners();
  }

  Future<void> suspendedUser(int ind, bool suspend) async {
    int id = int.parse(users[ind].id.toString());
    Map<String, dynamic> data = {"id": id, "suspend": suspend};
    Map response = await SuspendedUserApi().suspendedUser(data);
    var status = response['status'];
    String message = response['message'].toString();
    if (status) {
      locator<NavigationService>().navigateTo(userRoute);
      MyToast(message, webBgColor: "#828FA8");
    }
    notifyListeners();
  }
}
