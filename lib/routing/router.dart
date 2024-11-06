// ignore_for_file: missing_return

import 'package:fad_dashboard/modules/user/view/user_screen.dart';
import 'package:fad_dashboard/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case userRoute:
      return _getPageRoute( const UserScreen(), settings);
    
  }
  return null;
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
