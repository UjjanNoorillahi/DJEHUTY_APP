import 'package:getx_mvvm/data/network/network_api_service.dart';

import '../res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) {
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    print('inside main loginApi ${response.toString()}');
    return response;
  }

  Future<dynamic> signupApi(var data) {
    print('inside main signUpApi');
    dynamic response = _apiService.postApi(data, AppUrl.signupApi);
    return response;
  }

  Future<dynamic> checkScreenStatus(var data) {
    dynamic response = _apiService.postApi(data, AppUrl.checkScreenStatus);
    // debugPrint('inside main checkScreenStatus ${response .toString()}');
    return response;
  }
}
