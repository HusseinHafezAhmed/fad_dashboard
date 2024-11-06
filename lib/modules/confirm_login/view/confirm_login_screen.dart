// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

import '../../../core/widget/responsive.dart';
import '../controller/confirm_login_provider.dart';
import 'widgets/confirm_login_desktop.dart';
import 'widgets/confirm_login_mobile.dart';
import 'widgets/confirm_login_tablet.dart';

class ConfirmLoginScreen extends StatelessWidget {
  final String email;
  const ConfirmLoginScreen({required this.email});
  @override
  Widget build(BuildContext context) {
    document.addEventListener('keydown', (dynamic event) {
      if (event.code == 'Tab') {
        event.preventDefault();
      }
    });
    return ChangeNotifierProvider<ConfirmLoginProvider>(
        create: (_) => ConfirmLoginProvider(),
        child:  Responsive(
          mobile: ConfirmLoginMobileWidget(email: email,),
          desktop: ConfirmLoginDesktopWidget(email: email,),
          tablet: ConfirmLoginTabletWidget(email: email,),
        ));
  }
}
