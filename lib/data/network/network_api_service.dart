import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final reponse =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(reponse);

      print(
          'inside main getApi in network API Service api:  ${responseJson.toString()}');
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('Request Time Out');
    } on Exception catch (e) {
      throw AppExceptions(e.toString());
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(data, String url) async {
    print('inside main postApi in network API Service:  ${data.toString()}');
    print('inside main postApi in network API Service:  ${url.toString()}');
    dynamic responseJson;
    try {
      final reponse = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 15));
      responseJson = returnResponse(reponse);
      print(
          'inside main postApi in network API Service api:  ${responseJson.toString()}');
      print('Status Code:  ${reponse.statusCode.toString()}');
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('Request Time Out');
    } on Exception catch (e) {
      throw AppExceptions(e.toString());
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 409:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FatchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
