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
    getUsers(0, rowCount!.toInt(), filterMap);
  }
  UserProvider.update(Users user) {
    phoneNumberController.text = user.phoneNumber!.substring(2);
    emailController.text = user.email!;
    // passwordController.text = user.password!;
  }
  UserProvider.suspend();
  UserProvider.filter();
  Map<String, dynamic> filterMap = {
    "registrationNo": null,
    "PassportNo": null,
    "phoneNumber": null,
    "email": null,
    "userName": null,
    "userId": null,
    "createDateTimeFrom": "1970-11-06T13:53:36.982Z",
    "createDateTimeTo": DateTime.now().toIso8601String()
  };
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  togglePassword() {
    isPassword = !isPassword;
    notifyListeners();
  }

  Future<void> getUsers(int skip, int take, filter) async {
    takes = take;
    skips = skip;
    users = [];
    isTableFetching = true;
    notifyListeners();
    Map response = await GetUsersApi().getUsers(take, skip, filter);
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
    Map<String, dynamic> data = passwordController.text.trim() == ""
        ? {
            "id": id,
            "phoneNumber": "+2${phoneNumberController.text.trim()}",
            "email": emailController.text.trim(),
           // "password": null
          }
        : {
            "id": id,
            "phoneNumber": "+2${phoneNumberController.text.trim()}",
            "email": emailController.text.trim(),
            "password": passwordController.text
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
