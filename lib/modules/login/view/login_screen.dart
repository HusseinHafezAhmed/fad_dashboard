// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

import '../../../core/widget/responsive.dart';
import '../controller/login_provider.dart';
import 'widgets/login_desktop_widget.dart';
import 'widgets/login_mobile_widget.dart';
import 'widgets/login_tablet_widget.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    document.addEventListener('keydown', (dynamic event) {
      if (event.code == 'Tab') {
        event.preventDefault();
      }
    });
    return ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(),
        child: const Responsive(
          mobile: LoginMobileWidget(),
          desktop: LoginDesktopWidget(),
          tablet: LoginTabletWidget(),
        ));
  }
}
