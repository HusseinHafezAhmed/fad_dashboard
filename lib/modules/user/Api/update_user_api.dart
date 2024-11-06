
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Data_access_layer/api_connection.dart';
import '../../../Data_access_layer/sharedpref_constants.dart';

class UpdateUserApi {
  Future<Map> update(data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await ApiConnection().post(
        'auth-service/api/v1/dashboard/updateUser',
        options: Options(headers: {
          'Authorization':
              sharedPreferences.getString(SharedPrefConstants.accessToken)
        },),
    data: data);
  }
}
