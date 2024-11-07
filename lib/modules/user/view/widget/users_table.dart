
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../../core/constant/my_colors.dart';
import '../../../../core/widget/image.dart';
import '../../../../core/widget/text.dart';
import '../../controller/user_provider.dart';
import '../../model/users.dart';
import 'suspended_user_dialog.dart';
import 'update_user_dialog.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({Key? key, this.myProvider, this.isAll}) : super(key: key);
  final UserProvider? myProvider;
  final bool? isAll;

  @override
  _UsersTableState createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SfDataGridTheme(
          data: SfDataGridThemeData(),
          child: SfDataGrid(
            isScrollbarAlwaysShown: true,
            horizontalScrollPhysics: const AlwaysScrollableScrollPhysics(),
            verticalScrollPhysics: const NeverScrollableScrollPhysics(),
            columnWidthMode: ColumnWidthMode.auto,
            source: widget.myProvider!.usersDataSource!,
            columns: <GridColumn>[
              GridColumn(
                columnName: 'num',
                label: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: MyColors.sideMenuColor.withOpacity(.7),
                  alignment: Alignment.center,
                  child: MyText.drawText(
                      content: '#',
                      fontSize: 15,
                      fontColor: MyColors.whiteColor,
                      bold: true),
                ),
              ),
              GridColumn(
                  columnName: 'userName',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: 'User Name',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'email',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: 'Email',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'phoneNumber',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Phone Number',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'country',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Country',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'address',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Address',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'workStatus',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: 'Work Status',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'passportNo',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Passport Number',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'registrationNo',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Registration Number',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'verified',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    child: MyText.drawText(
                        content: 'Verified',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  columnName: 'suspended',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: 'Suspended',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              GridColumn(
                  width: 220,
                  columnName: 'syndicateId',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: 'Syndicate Id',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),

              // GridColumn(
              //     width: 170,
              //     columnName: 'suspendedReason',
              //     label: Container(
              //       padding: const EdgeInsets.all(4.0),
              //       alignment: Alignment.center,
              //       child: MyText.drawText(
              //           content: 'Suspended Reason',
              //           fontSize: 15,
              //           fontColor: MyColors.whiteColor,
              //           bold: true),
              //     )),
              GridColumn(
                  columnName: 'updateUser',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: '',
                        fontSize: 15,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
              // GridColumn(
              //     width: 50,
              //     columnName: 'delete',
              //     label: Container(
              //       padding: const EdgeInsets.all(4.0),
              //       alignment: Alignment.center,
              //       child: MyText.drawText(
              //           content: '',
              //           fontSize: 15,
              //           fontColor: MyColors.whiteColor,
              //           bold: true),
              //     )),
              GridColumn(
                  columnName: 'suspend',
                  label: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: MyColors.sideMenuColor.withOpacity(.7),
                    alignment: Alignment.center,
                    child: MyText.drawText(
                        content: '',
                        fontSize: 14,
                        fontColor: MyColors.whiteColor,
                        bold: true),
                  )),
            ],
          )),
    );
  }
}

class UsersDataSource extends DataGridSource {
  List<Users>? _paginatedUsers = [];
  int? usersCount;
  BuildContext? bContext;
  String? userName;

  /// Creates the user data source class with required details.
  UsersDataSource(
      {@required List<Users>? userData, int? total, BuildContext? context}) {
    _paginatedUsers = userData;
    usersCount = total;
    bContext = context;

    _userData = _paginatedUsers!
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'num',
                  value: (_paginatedUsers!.indexOf(e) + 1).toString()),
              DataGridCell<String>(columnName: 'userName', value: e.userName),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(
                  columnName: 'phoneNumber', value: e.phoneNumber),
              DataGridCell<String>(columnName: 'country', value: e.country),
              DataGridCell<String>(columnName: 'address', value: e.address),
              DataGridCell<String>(
                  columnName: 'workStatus', value: e.workStatus),
              DataGridCell<String>(
                  columnName: 'passportNo', value: e.passportNo),
              DataGridCell<String>(
                  columnName: 'registrationNo',
                  value: e.registrationNo == null
                      ? ''
                      : e.registrationNo.toString()),
              DataGridCell<String>(
                  columnName: 'verified', value: e.isverify.toString()),
              DataGridCell<String>(
                  columnName: 'suspended', value: e.isSuspended.toString()),
              DataGridCell<String>(
                  columnName: 'syndicateId', value: e.syndicateId ?? ""),

              DataGridCell<Users>(columnName: 'updateUser', value: e),
              //const DataGridCell<String>(columnName: 'delete', value: 'حذف'),
              DataGridCell<Users>(columnName: 'suspend', value: e),
            ]))
        .toList();
  }

  List<DataGridRow> _userData = [];

  @override
  List<DataGridRow> get rows => _userData;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 1) {
        return Colors.transparent;
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        color: getRowBackgroundColor(),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        child: e.columnName == 'updateUser'
            ? UpdateUserContainer(
                e: e.value,
                i: effectiveRows.indexOf(row),
              )
            : e.columnName == 'syndicateId'
                ? ImageContainer(url: e.value)
                // : e.columnName == 'delete'
                //     ? DeleteContainer(
                //         e: e,
                //         i: effectiveRows.indexOf(row),
                //       )
                    : e.columnName == 'suspend'
                        ? SuspendedUser(
                            e: e.value,
                            i: effectiveRows.indexOf(row),
                          )
                        : MyText.drawSelectableText(
                            content: e.value.toString(),
                            fontSize: 14,
                            bold: false,
                            fontColor: MyColors.dataDarkGreen),
      );
    }).toList());
  }
}

class UpdateUserContainer extends StatelessWidget {
  const UpdateUserContainer({Key? key, required this.i, required this.e})
      : super(key: key);
  final Users e;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        showDialog(
          builder: (context) => Container(
            alignment: Alignment.center,
            child: Container(
                height: 350,
                width: 650,
                color: Colors.white,
                child: UpdateUserDialog(
                  index: i,
                  user: e,
                )),
          ),
          context: context,
        );
      },
      child: MyImage.drawImage('assets/icons/edit.svg',
          color: MyColors.dataDarkGreen, width: 20, height: 20),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String url;
  const ImageContainer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return const SizedBox();
    } else {
      return MyImage.drawClickableImage(url,
          width: 200, height: 150, fit: BoxFit.contain, onTap: () {
        showDialog(
            context: context,
            builder: (context) => GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    height: 400,
                    width: 400,
                    child: MyImage.drawImage(
                      url,
                      fit: BoxFit.contain,
                    ),
                  ),
                ));
      });
    }
  }
}

// class DeleteContainer extends StatelessWidget {
//   const DeleteContainer({Key? key, this.i, this.e}) : super(key: key);
//   final e;
//   final i;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(builder: (_, UserProvider myProvider, child) {
//       return InkWell(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           hoverColor: Colors.transparent,
//           onTap: () async {
//             showDialog(
//               builder: (context) => Container(
//                 alignment: Alignment.center,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12)),
//                   width: 400,
//                   padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
//                   child: Center(
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           MyText.drawText(
//                               content:
//                                   'Are you sure you want to delete this user?',
//                               fontColor: MyColors.primaryColor,
//                               bold: true,
//                               fontSize: 18),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 30.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Flexible(
//                                   child: AppButton(
//                                     key: const Key('desktop'),
//                                     color: MyColors.greyColor,
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     buttonText: 'Cancel',
//                                     textSize: 15,
//                                     height: 40,
//                                     width: 160,
//                                   ),
//                                 ),
//                                 Flexible(
//                                   child: AppButton(
//                                     key: const Key('desktop'),
//                                     color: MyColors.primaryColor,
//                                     onPressed: () async {
//                                       //   await myProvider.deleteUser(i);
//                                       Navigator.pop(context);
//                                     },
//                                     buttonText: 'Confirm',
//                                     textSize: 15,
//                                     height: 40,
//                                     width: 160,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ]),
//                   ),
//                 ),
//               ),
//               context: context,
//             );
//           },
//           child: MyImage.drawImage('assets/icons/delete.svg',
//               color: Colors.red, width: 20, height: 20));
//     });
//   }
// }

class SuspendedUser extends StatelessWidget {
  const SuspendedUser({Key? key, required this.i, required this.e})
      : super(key: key);
  final Users e;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        showDialog(
          builder: (context) => Container(
            alignment: Alignment.center,
            child: Container(
                height: 240,
                width: 750,
                color: Colors.white,
                child: SuspendedUserDialog(
                  index: i,
                  user: e,
                )),
          ),
          context: context,
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
        child: Container(
            decoration: BoxDecoration(
              color: MyColors.sideMenuColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: MyText.drawText(
                  content: e.isSuspended! ? "UnSuspend" : 'Suspend',
                  fontSize: 12,
                  fontColor: Colors.white),
            )),
      ),
    );
  }
}

// class UnSuspendedUser extends StatelessWidget {
//   const UnSuspendedUser({Key? key, this.i, this.e}) : super(key: key);
//   final e;
//   final i;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       onTap: () async {
//         // await Provider.of<UserProvider>(context, listen: false)
//         //     .unSuspendedUser(i);
//       },
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
//         child: Container(
//             decoration: BoxDecoration(
//               color: MyColors.primaryColor,
//               borderRadius: BorderRadius.circular(3),
//             ),
//             child: Center(
//               child: MyText.drawText(
//                   content: 'UnSuspended',
//                   fontSize: 12,
//                   fontColor: Colors.white),
//             )),
//       ),
//     );
//   }
// }
