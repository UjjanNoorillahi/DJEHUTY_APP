import 'package:getx_mvvm/data/network/network_api_service.dart';

import '../res/app_url/app_url.dart';

class ProfileRepository {
  final _apiService = NetworkApiService();

  // API call to save/update the user profile
  Future<dynamic> getUserProfile(String userId) async {
    String url = AppUrl.showProfile + userId;
    print('Sending data to save user profile:$url');
    dynamic response = await _apiService.getApi(url);
    return response;
  }
}
