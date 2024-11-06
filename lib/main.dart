import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Data_access_layer/sharedpref_constants.dart';
import 'GUI/dashboard.dart';
import 'Provider/main_provider.dart';
import 'locator.dart';
import 'modules/login/view/login_screen.dart';
import 'routing/router.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  // MainProvider.navigatorKey = GlobalKey<NavigatorState>();

  WidgetsFlutterBinding.ensureInitialized();

  /// called init
  //await SharedPrefrencesHelper.init();
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: SystemUiOverlay.values,
  // );

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.light,
  //   systemNavigationBarColor: Colors.white,
  // ));

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.light,

  //   systemNavigationBarColor: Colors.white,
  // ));
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            ChangeNotifierProvider<MainProvider>(
                create: (_) => MainProvider(),
                child: MaterialApp(
                  title: 'Federation of Arab Dentists',
                  shortcuts: {
                    LogicalKeySet(LogicalKeyboardKey.space):
                        const ActivateIntent(),
                  },
                  navigatorKey: MainProvider
                      .navigatorKey, // Setting a global key for navigator
                  home: sharedPreferences
                          .containsKey(SharedPrefConstants.accessToken)
                      ? DashboardScreen(
                          userType: sharedPreferences
                              .getString(SharedPrefConstants.userType))
                      : LogInScreen(),
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: generateRoute,
                )),
          ));
}
