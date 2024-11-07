import 'package:fad_dashboard/core/widget/button.dart';
import 'package:fad_dashboard/modules/user/view/widget/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../core/constant/my_colors.dart';
import '../../../core/validation/validation.dart';
import '../../../core/widget/image.dart';
import '../../../core/widget/text.dart';
import '../controller/user_provider.dart';
import 'widget/users_table.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: _UserBody(),
    );
  }
}

class _UserBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserBodyState();
  }
}

class _UserBodyState extends State<_UserBody> with InputValidation {
  final formGlobalKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  String? get createNotificationRoute => null;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, UserProvider myProvider, child) {
        return Scaffold(
          backgroundColor: MyColors.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Container(
                                  alignment: Alignment.center,
                                  color: MyColors.whiteColor.withOpacity(.3),
                                  child: Container(
                                    width: 700,
                                    height: 550,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: MyColors.bgColor,
                                    ),
                                    child: FilterDialog(),
                                  ),
                                ),
                              ).then((value) => myProvider.getUsers(
                                  0,
                                  myProvider.rowCount!.toInt(),
                                  value ??
                                      {
                                        "registrationNo": null,
                                        "PassportNo": null,
                                        "phoneNumber": null,
                                        "email": null,
                                        "userName": null,
                                        "userId": null,
                                        "createDateTimeFrom":
                                            "1970-11-06T13:53:36.982Z",
                                        "createDateTimeTo":
                                            DateTime.now().toIso8601String()
                                      }));
                            },
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: 100,
                            buttonText: 'Filter',
                            color: MyColors.sideMenuColor,
                            textColor: MyColors.whiteColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MyText.drawText(
                            content: 'Users',
                            fontColor: MyColors.lightBlackColor,
                            bold: true,
                            fontSize: 22),
                        const SizedBox(
                          height: 30,
                        ),
                        myProvider.isTableFetching
                            ? Center(
                                child: CircularProgressIndicator(
                                color: MyColors.sideMenuColor,
                              ))
                            : SizedBox(
                                height: UserProvider.users.isEmpty
                                    ? 600
                                    : (myProvider.length! * 49.toDouble()) + 70,
                                child: myProvider.isTableFetching
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: MyColors.sideMenuColor,
                                        ),
                                      )
                                    : Card(
                                        child: myProvider.total == 0
                                            ? SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    MyImage.drawImage(
                                                        'assets/images/page-not-found.png',
                                                        fit: BoxFit.fill,
                                                        height: 300,
                                                        width: 300,
                                                        defaultUrl:
                                                            'assets/images/logo.png')!,
                                                    MyText.drawText(
                                                        content: 'No Results',
                                                        fontColor: MyColors
                                                            .lightBlackColor,
                                                        bold: true,
                                                        fontSize: 22),
                                                  ],
                                                ),
                                              )
                                            : UsersTable(
                                                myProvider: myProvider,
                                                isAll: true,
                                              ))),
                        const SizedBox(
                          height: 10,
                        ),
                        myProvider.total != 0
                            ? Directionality(
                                textDirection: TextDirection.ltr,
                                child: NumberPagination(
                                  onPageChanged: (selected) {
                                    myProvider.selected = selected;
                                    if (myProvider.skips! <=
                                        myProvider.total!) {
                                      int offset = (selected - 1) *
                                          myProvider.rowCount!.toInt();

                                      myProvider.getUsers(
                                          offset,
                                          myProvider.rowCount!.toInt(),
                                          myProvider.filterMap);
                                    }
                                  },
                                  pageTotal:
                                      (myProvider.total! / myProvider.rowCount!)
                                          .ceil(),
                                  colorPrimary: MyColors.sideMenuColor,
                                  threshold: 5,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
