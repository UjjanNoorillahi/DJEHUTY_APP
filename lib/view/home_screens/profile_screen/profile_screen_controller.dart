import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/profile_repository.dart';
import '../../../user_preference/user_preference_controller.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  UserPreference userPreference = UserPreference();
  final ProfileRepository repository = ProfileRepository(); // Set your base URL

  var isLoading = false.obs; // Observable for loading state
  dynamic profileData = {}.obs; // Observable for profile data

  // Fetch user profile data
  Future<void> fetchUserProfile(String userId) async {
    try {
      isLoading.value = true;
      final data = await repository.getUserProfile(userId);
      // Call the API to fetch data
      print('Data: $data');
      profileData.value = data; // Update observable data
      print('Profile Data: $profileData');
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch profile data: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Save user profile data
  // Future<void> saveUserProfile(Map<String, dynamic> data, String userId) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await repository.saveUserProfile(data, userId); // Call the API to save data
  //     if (response != null) {
  //       Get.snackbar("Success", "Profile updated successfully",
  //           snackPosition: SnackPosition.BOTTOM);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to save profile data: $e",
  //         snackPosition: SnackPosition.BOTTOM);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
