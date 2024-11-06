// ignore_for_file: no_logic_in_create_state

import 'package:fad_dashboard/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Provider/main_provider.dart';
import '../core/constant/my_colors.dart';
import '../core/services/navigation_service.dart';
import '../core/validation/validation.dart';
import '../core/widget/image.dart';
import '../core/widget/side_menu.dart';
import '../locator.dart';
import '../routing/router.dart';

class DashboardScreen extends StatelessWidget {
  final Widget? child;
  final String? userType;
  const DashboardScreen({Key? key, this.child, this.userType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(),
      child: _DashboardProviderBody(
        userType: userType,
        child: child,
      ),
    );
  }
}

class _DashboardProviderBody extends StatefulWidget {
  final Widget? child;
  final String? userType;
  const _DashboardProviderBody({Key? key, this.child, this.userType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardProviderBodyState(child, userType);
  }
}

class _DashboardProviderBodyState extends State<_DashboardProviderBody>
    with InputValidation {
  final Widget? child;
  final String? userType;

  _DashboardProviderBodyState(this.child, this.userType);
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, MainProvider myProvider, __) {
        return ResponsiveBuilder(
          builder: (context, sizingInfo) => Scaffold(
            backgroundColor: MyColors.backgroundGreyColor,
            appBar: !sizingInfo.isDesktop
                ? AppBar(
                    backgroundColor: MyColors.sideMenuColor,
                  )
                : null,
            drawer: !sizingInfo.isDesktop
                ? SideMenu(
                    myProvider: myProvider,
                  )
                : null,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !sizingInfo.isDesktop
                    ? Container()
                    : Expanded(
                        child: SideMenu(
                        myProvider: myProvider,
                       // role: userType,
                      )),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       // Row(children: [
                      //       //   SizedBox(
                      //       //       height: 40.h,
                      //       //       width: 20.w,
                      //       //       child: Container(
                      //       //         decoration: BoxDecoration(
                      //       //             shape: BoxShape.rectangle,
                      //       //             color: MyColors.greyColor,
                      //       //             borderRadius: const BorderRadius.all(
                      //       //                 Radius.circular(20)),
                      //       //             border: Border.all(
                      //       //                 width: 1,
                      //       //                 color: Colors.grey[300]!)),
                      //       //         child: DropdownButton<String>(
                      //       //           value: "New",
                      //       //           alignment: Alignment.center,
                      //       //           borderRadius: const BorderRadius.all(
                      //       //               Radius.circular(20)),
                      //       //           icon: const Icon(
                      //       //               Icons.arrow_drop_down_rounded),
                      //       //           dropdownColor: Colors.white,
                      //       //           iconSize: 25,
                      //       //           isExpanded: true,
                      //       //           hint: Container(
                      //       //             padding:
                      //       //                 const EdgeInsets.only(right: 20),
                      //       //             child: Text(
                      //       //               '',
                      //       //               textAlign: TextAlign.start,
                      //       //               style: TextStyle(
                      //       //                 color: MyColors.lightBlackColor,
                      //       //                 fontSize: 15.sp,
                      //       //                 fontFamily: "The-Sans-Plain",
                      //       //                 fontWeight: FontWeight.w500,
                      //       //               ),
                      //       //             ),
                      //       //           ),
                      //       //           style: TextStyle(
                      //       //             color: MyColors.lightBlackColor,
                      //       //             fontFamily: "The-Sans-Plain",
                      //       //             fontSize: 15.sp,
                      //       //             fontWeight: FontWeight.w500,
                      //       //           ),
                      //       //           underline: Container(),
                      //       //           onChanged: (String? newValue) async {
                      //       //             // setState(() {
                      //       //             //   myProvider.role =
                      //       //             //       newValue ?? '';
                      //       //             // });
                      //       //             // myProvider.englishYear =
                      //       //             //     genderFromArabic(newValue!);
                      //       //
                      //       //             //    await myProvider.branchesLoop();
                      //       //           },
                      //       //           items: [
                      //       //             "New",
                      //       //             "User",
                      //       //             "Site",
                      //       //             "Asset",
                      //       //             "Script",
                      //       //             "Monitored Device"
                      //       //           ]
                      //       //               .map(
                      //       //                 (String value) =>
                      //       //                     DropdownMenuItem<String>(
                      //       //                   value: value,
                      //       //                   child: Center(
                      //       //                     child: Text(
                      //       //                       value,
                      //       //                     ),
                      //       //                   ),
                      //       //                 ),
                      //       //               )
                      //       //               .toList(),
                      //       //         ),
                      //       //       )),
                      //       //   const SizedBox(width: 14),
                      //       //   SizedBox(
                      //       //     width: 120.w,
                      //       //     height: 100.h,
                      //       //     child: getSearchTextInputField(
                      //       //       content: " ",
                      //       //       //controller: myProvider.searchUsernameController,
                      //       //       hintText: "Search",
                      //       //       iconButtonWidget: InkWell(
                      //       //         child: const Icon(Icons.search),
                      //       //         onTap: () {
                      //       //           // myProvider.filteredStudents();
                      //       //         },
                      //       //       ),
                      //       //       textInputAction: TextInputAction.done,
                      //       //       fontColor: Colors.black,
                      //       //       // validatorFunction: validatePhoneNumber,
                      //       //       fontSize: 14,
                      //       //       //   readOnly: false,
                      //       //     ),
                      //       //   ),
                      //       // ]),
                      //       Row(children: [
                      //         // const HeaderIcon(image: 'assets/images/daf_logo.png'),
                      //         // SizedBox(width: 2.w),
                      //         // const HeaderIcon(image: 'assets/images/daf_logo.png'),
                      //         // SizedBox(width: 2.w),
                      //         // const HeaderIcon(image: 'assets/images/daf_logo.png'),
                      //         // SizedBox(width: 2.w),
                      //         // const HeaderIcon(image: 'assets/images/daf_logo.png'),
                      //             myProvider.userName == null?
                      //             MyText.drawText(
                      //                 content: LoginProvider.userName! ,
                      //                 fontColor: MyColors.lightBlackColor,
                      //                 bold: true,
                      //                 fontSize: 18):
                      //         MyText.drawText(
                      //             content: myProvider.userName! ,
                      //             fontColor: MyColors.lightBlackColor,
                      //             bold: true,
                      //             fontSize: 18),
                      //         const SizedBox(width: 3),
                      //         Container(
                      //           width: 30,
                      //           height: 30,
                      //           decoration: const BoxDecoration(
                      //             shape: BoxShape.circle,
                      //           ),
                      //           child: MyImage.drawImage(
                      //             'assets/images/profile.png',
                      //           )!,
                      //         ),
                      //       ]),
                      //     ],
                      //   ),
                      // ),
                      
                      Expanded(
                        child: Navigator(
                          key: locator<NavigationService>().navigatorKey,
                          onGenerateRoute: generateRoute,
                          initialRoute: userRoute,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: MyColors.greyColor),
      child: MyImage.drawImage(image!, height: 16, width: 16)!,
    );
  }
}
