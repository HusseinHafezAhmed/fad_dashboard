import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data_access_layer/api_connection.dart';
import '../../../Data_access_layer/sharedpref_constants.dart';

class GetUsersApi {
  Future<Map> getUsers(int take, int skip,filter) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await ApiConnection().post(
        'auth-service/api/v1/dashboard/getUsers/$skip/$take',
        options: Options(headers: {
          'Authorization':
              sharedPreferences.getString(SharedPrefConstants.accessToken)
        }),
        data: filter);
  }
}
