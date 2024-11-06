
import '../../../Data_access_layer/api_connection.dart';

class ConfirmLoginApi {
  Future<Map> confirmLogin(map) async {
    return await ApiConnection()
        .post('auth-service/api/v1/dashboard/confirm-login', data: map);
  }
}
