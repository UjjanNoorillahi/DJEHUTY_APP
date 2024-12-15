import 'package:getx_mvvm/data/network/network_api_service.dart';
import '../res/app_url/app_url.dart';

class UserProfileRepository {
  final _apiService = NetworkApiService();

  // API call to save/update the user profile
  Future<dynamic> saveUserProfile(Map<String, dynamic> data) async {
    print('Sending data to save user profile: ${data.toString()}');
    dynamic response = await _apiService.postApi(data, AppUrl.createProfile);
    return response;
  }
}
