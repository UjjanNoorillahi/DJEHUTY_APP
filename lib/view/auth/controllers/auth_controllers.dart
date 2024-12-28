import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/routes/routes_name.dart';

class AuthController extends GetxController {
  // Method to check user and navigate
  Future<void> checkUser() async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userId = sp.getString('userId');

      if (userId == null || userId.isEmpty) {
        // Navigate to Login Screen if userId is not available
        Get.offNamed(RoutesName.getStartedScreen);
      } else {
        // Call API to get screen status
        String apiUrl = '${AppUrl.baseUrl}/auth/check-screen-status';
        log('API URL: $apiUrl');
        var response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'userId': userId}),
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['status'] == 'success') {
            String screen = data['data']['screen'];
            if (screen == 'UserProfileScreen') {
              Get.offNamed(RoutesName.userProfile);
            } else if (screen == 'HealthScreen') {
              Get.offNamed(RoutesName.healthQuestionScreen);
            } else if (screen == 'InterviewScreen') {
              Get.offNamed(RoutesName.interviewQuestions);
            } else {
              Get.offNamed(RoutesName.homeScreen);
            }
          } else {
            throw Exception(data['message']);
          }
        } else {
          throw Exception('Failed to fetch screen status.');
        }
      }
    } catch (e) {
      debugPrint('Error in checkUser: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
