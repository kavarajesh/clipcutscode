import '../../../../services/network/base_url.dart';
import '../../../../services/network/http_base_service.dart';

class LoginRepostitory {
  ApiService apiService = ApiService();

  loginApi(String email, String password,String deviceId,String deviceType) async {
    final response = await apiService.getResponse(
      "${BaseUrlService.loginUrl}",
      requestType: RequestType.aPost,
      body: {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "device_type": deviceType.toLowerCase(),
        "device_token":"dhsbchsbhsadsaded"
      },
    );
    return response;
  }
}

//username: 'emilys',
//password: 'emilyspass',
