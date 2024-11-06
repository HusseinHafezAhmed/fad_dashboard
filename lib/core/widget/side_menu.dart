// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api
import 'package:fad_dashboard/modules/login/Api/log_out_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data_access_layer/sharedpref_constants.dart';
import '../../Provider/main_provider.dart';
import '../../locator.dart';
import '../../modules/login/view/login_screen.dart';
import '../../routing/route_names.dart';
import '../constant/my_colors.dart';
import '../services/navigation_service.dart';
import 'drawer_tile.dart';
import 'image.dart';
import 'text.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, this.myProvider}) : super(key: key);
  final MainProvider? myProvider;
  // final String? role;
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (_, MainProvider myProvider, child) {
      return Drawer(
        //backgroundColor: const Color.fromARGB(255, 4, 54, 57),
        backgroundColor: MyColors.sideMenuColor,
        elevation: 0,
        child: SingleChildScrollView(
          primary: false,
          child: SizedBox(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderWidget(),
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    // LoginProvider.userType == 'admin' ||
                    //         myProvider.userType == 'admin'
                    //     ? Column(
                    //         children: [

                    DrawerTile(
                      icon: "assets/icons/all_users.svg",
                      title: 'Users',
                      index: 1,
                      myProvider: widget.myProvider,
                      onTap: () {
                        myProvider.changeTabIndex(1);
                        setState(() {
                          widget.myProvider!.tabIndex = 1;
                        });
                        locator<NavigationService>().navigateTo(userRoute);
                      },
                    ),

                    //   ],
                    // )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: MyColors.whiteColor,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () async {
                        var navKey = MainProvider.navigatorKey;
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        // String? userType = sharedPreferences
                        //     .getString(SharedPrefConstants.userType);
                        Map res = await LogOutApi().getLogOutApi();

                        if (res['status'] == true) {
                          sharedPreferences
                              .remove(SharedPrefConstants.accessToken);
                          sharedPreferences.remove(SharedPrefConstants.userId);
                          sharedPreferences
                              .remove(SharedPrefConstants.userType);
                          sharedPreferences
                              .remove(SharedPrefConstants.userName);
                        //  sharedPreferences.remove(SharedPrefConstants.email);
                          Navigator.pushReplacement(navKey.currentContext!,
                              MaterialPageRoute(builder: (_) => LogInScreen()));
                        }
                      },
                      horizontalTitleGap: 4,
                      leading: MyImage.drawImage('assets/icons/logout.svg',
                          color: MyColors.whiteColor, height: 15, width: 15),
                      title: MyText.drawText(
                          content: "Logout",
                          fontColor: MyColors.whiteColor,
                          fontSize: 12,
                          bold: true),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, bottom: 20.0, left: 10, right: 10),
      child: ListTile(
        tileColor: MyColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        horizontalTitleGap: 4,
        leading: MyImage.drawImage('assets/images/fad_logo.png',
            height: 30, width: 30),
        title: MyText.drawText(
            content: "Federation of Arab Dentists",
            fontColor: MyColors.sideMenuColor,
            fontSize: 13,
            bold: true),
      ),
    );
  }
}
