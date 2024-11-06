import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/main_provider.dart';
import '../core/widget/toast.dart';
import '../modules/login/view/login_screen.dart';
import 'sharedpref_constants.dart';

class ApiConnection {
  Dio? _connection;

  ApiConnection() {
    _connection = Dio();
    _connection = Dio()
      ..interceptors.addAll([
        HttpFormatter(),
      ]);
    _connection!.options.contentType = 'application/json; charset=UTF-8';
    _connection!.options.baseUrl = dotenv.env['BASE_URL']!;
   // _connection!.options.baseUrl = 'https://ticketingsystem.pharmacastle-ksa.org/';

    ///--------------------------///
    _connection!.options.validateStatus = (status) {
      return status! < 500;
    };
    _connection!.options.followRedirects = false;

    ///------------------------///

    _connection!.options.connectTimeout = const Duration(seconds: 30); //5s
    _connection!.options.receiveTimeout = const Duration(seconds: 30); //5s
  }

  Future<Map> get(String url, {Map<String, dynamic>? query, options}) async {
    Map returnData;

    Response response = await _connection!
        .get(url, queryParameters: query, options: options)
        .onError((error, stackTrace) {
      MyToast('Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -1,
        'message': "error"
      };
      throw MyToast('Something went wrong please try again later');
    });
    try {
      ///-------------(status = false)-----------//
      if (!response.data['status']) {
        if (response.data['message'].toString().contains("تم تسجيل الخروج")) {
          var navKey = MainProvider.navigatorKey;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.remove(SharedPrefConstants.accessToken);
          sharedPreferences.remove(SharedPrefConstants.userId);
          sharedPreferences.remove(SharedPrefConstants.userType);
          sharedPreferences.remove(SharedPrefConstants.userName);
          sharedPreferences.remove(SharedPrefConstants.email);
          Navigator.pushReplacement(navKey.currentContext!,
              MaterialPageRoute(builder: (_) => LogInScreen()));
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        } else {
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        }
      }

      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };
    } catch (e) {
      MyToast('Server Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -2,
        'message': e.toString()
      };
    }
    return returnData;
  }

  Future<Map> post(String url,
      {Map<String?, dynamic>? data, Map? query, options}) async {
    Map returnData;
    Response response = await _connection!
        .post(url, data: data, options: options)
        .onError((error, stackTrace) {

      MyToast('Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -1,
        'message': "error"
      };
      throw MyToast('Something went wrong please try again later');
    });

    try {
      ///-------------(status = false)-----------//
      if (!response.data['status']) {
        if (response.data['message'].toString().contains("تم تسجيل الخروج")) {
          var navKey = MainProvider.navigatorKey;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.remove(SharedPrefConstants.accessToken);
          sharedPreferences.remove(SharedPrefConstants.userId);
          sharedPreferences.remove(SharedPrefConstants.userType);
          sharedPreferences.remove(SharedPrefConstants.userName);
          sharedPreferences.remove(SharedPrefConstants.email);
          Navigator.pushReplacement(navKey.currentContext!,
              MaterialPageRoute(builder: (_) => LogInScreen()));
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        } else {
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        }
      }

      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };
    } catch (e) {
      // print(e.toString());
      MyToast('Server Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -2,
        'message': e.toString()
      };
    }
    return returnData;
  }

  Future<Map> put(String url,
      {Map<String, dynamic>? data, Map? query, options}) async {
    Map returnData;
    Response response = await _connection!
        .put(url, data: data, options: options)
        .onError((error, stackTrace) {
      MyToast('Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -1,
        'message': "error"
      };
      throw MyToast('Something went wrong please try again later');
    });

    try {
      ///-------------(status = false)-----------//
      if (!response.data['status']) {
        if (response.data['message'].toString().contains("تم تسجيل الخروج")) {
          var navKey = MainProvider.navigatorKey;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.remove(SharedPrefConstants.accessToken);
          sharedPreferences.remove(SharedPrefConstants.userId);
          sharedPreferences.remove(SharedPrefConstants.userType);
          sharedPreferences.remove(SharedPrefConstants.userName);
          sharedPreferences.remove(SharedPrefConstants.email);
          Navigator.pushReplacement(navKey.currentContext!,
              MaterialPageRoute(builder: (_) => LogInScreen()));
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        } else {
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        }
      }

      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };
    } catch (e) {
      MyToast('Server Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -2,
        'message': e.toString()
      };
    }
    return returnData;
  }

  Future<Map> patch(String url,
      {Map<String, dynamic>? data, Map? query, options}) async {
    Map returnData;
    Response response = await _connection!
        .patch(url, data: data, options: options)
        .onError((error, stackTrace) {
      MyToast('Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -1,
        'message': "error"
      };
      throw MyToast('Something went wrong please try again later');
    });

    try {
      ///-------------(status = false)-----------//
      if (!response.data['status']) {
        if (response.data['message'].toString().contains("تم تسجيل الخروج")) {
          var navKey = MainProvider.navigatorKey;
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          sharedPreferences.remove(SharedPrefConstants.accessToken);
          sharedPreferences.remove(SharedPrefConstants.userId);
          sharedPreferences.remove(SharedPrefConstants.userType);
          sharedPreferences.remove(SharedPrefConstants.userName);
          sharedPreferences.remove(SharedPrefConstants.email);
          Navigator.pushReplacement(navKey.currentContext!,
              MaterialPageRoute(builder: (_) => LogInScreen()));
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        } else {
          MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
        }
      }

      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };
    } catch (e) {
      MyToast('Server Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -2,
        'message': e.toString()
      };
    }
    return returnData;
  }

  Future<Map> delete(String url,
      {Map<String, dynamic>? data, Map? query, options}) async {
    Map returnData;
    Response response = await _connection!
        .delete(url, data: data, options: options)
        .onError((error, stackTrace) {
      MyToast('Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -1,
        'message': "error"
      };
      throw MyToast('Something went wrong please try again later');
    });
    try {
      ///-------------(status = false)-----------//
      if (!response.data['status']) {
        MyToast(response.data['message'].toString(), webBgColor: "#F13C15");
      }

      ///----------------(response)--------------//
      returnData = {
        'data': response.data['data'],
        'status': response.data['status'],
        'action_code': checkCode(response.statusCode),
        'message': response.data['message']
      };
    } catch (e) {
      // print(e.toString());
      MyToast('Server Error', webBgColor: "#F13C15");
      returnData = {
        'data': null,
        'status': false,
        'action_code': -2,
        'message': e.toString()
      };
    }
    return returnData;
  }

  int checkCode(code) {
    switch (int.parse(code.toString())) {

    ///------------(connection error)-----------//
      case 201:
        return 0;

    ///------------(server error)-----------//
      case 404:
        return 1;

    ///------------(request error)-----------//
      case 500:
        return 2;

    ///------------(invalid data)-----------//
      case 400:
        return 3;

    ///------------(valid)-----------//
      case 200:
        return 100;
    ///------------(default)-----------//
      default:
        return -1;
    }
  }
}
