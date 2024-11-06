
import '../../../Data_access_layer/api_connection.dart';

class LoginApi {
  Future<Map> login(map) async {
    return await ApiConnection()
        .post('auth-service/api/v1/dashboard/login', data: map);
  }
}
