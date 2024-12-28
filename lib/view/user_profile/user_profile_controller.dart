import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/user_profile_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../res/app_url/app_url.dart';
import '../../user_preference/user_preference_controller.dart';

class UserProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  final photoController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final currentWeightController = TextEditingController();
  final goalWeightController = TextEditingController();
  final currentBodyFatController = TextEditingController();
  final goalBodyFatController = TextEditingController();

  UserPreference userPreference = UserPreference();
  final UserProfileRepository repository =
      UserProfileRepository(); // Set your base URL

  // Gender Dropdown
  final genderList = ["Male", "Female", "Other"];
  var selectedGender = "Male".obs;

  // Image
  var profilePhoto = "".obs;
  var isLoading = false.obs;

  // File picker and camera
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final permission = await _requestPermission(source);
    print("Permission: $permission");
    if (permission) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        profilePhoto.value = pickedFile.path;
        Get.back();
      }
    } else {
      Get.snackbar(
          "Permission Denied", "Please enable permissions in settings");
    }
  }

  Future<bool> _requestPermission(ImageSource source) async {
    PermissionStatus status;

    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
      print("Camera Permission: $status");
    } else {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<void> uploadPhoto(String filePath) async {
    final url = Uri.parse(AppUrl.uploadPhoto); // Replace with your API endpoint

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', url);

      // Attach file
      var file = await http.MultipartFile.fromPath('photo', filePath);
      request.files.add(file);

      // Send request
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        // Convert the response stream to a string
        String responseBody = await response.stream.bytesToString();

        // Decode the JSON response
        Map<String, dynamic> responseData = json.decode(responseBody);

        // Extract the 'url' field
        String uploadedImageUrl = responseData['url'];

        // Assign the URL to your variable
        profilePhoto.value = uploadedImageUrl;

        print("Upload successful! Image URL: $uploadedImageUrl");
      } else {
        print("Upload failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading photo: $e");
    }
  }

  Future<void> saveProfile() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await uploadPhoto(profilePhoto.value);
      // Fetch user data from SharedPreferences
      final userModel = await userPreference.getUser();

      // Prepare data for API
      final data = {
        "userid": userModel.user?.id ?? "", // Fetch userId from UserModel
        "profilePhoto": profilePhoto.value,
        "phoneNumber": phoneNumberController.text,
        "address": addressController.text,
        "country": countryController.text,
        "state": stateController.text,
        "city": cityController.text,
        "age": ageController.text,
        "gender": selectedGender.value,
        "height": heightController.text,
        "currentweight": currentWeightController.text,
        "goalweight": goalWeightController.text,
        "currentbodyfat": currentBodyFatController.text,
        "goalbodyfat": goalBodyFatController.text,
      };

      print("User Profile Data: $data");

// Make API call
      final response = await repository.saveUserProfile(data);
      isLoading.value = false;

      print("Response: $response");

// Check the response and show appropriate message
      if (response['status'] == 'success') {
        Get.snackbar("Success", "Profile saved successfully!");
        Get.offNamedUntil(RoutesName.healthQuestionScreen, (route) => false);

        // clear all text fields
        phoneNumberController.clear();
        addressController.clear();
        countryController.clear();
        stateController.clear();
        cityController.clear();
        zipCodeController.clear();
        ageController.clear();
        heightController.clear();
        currentWeightController.clear();
        goalWeightController.clear();
        currentBodyFatController.clear();
        goalBodyFatController.clear();
      } else if (response['status'] == 'error') {
        String errorMessage = response['message'] ?? 'Unknown error occurred';
        if (errorMessage.contains('phoneNumber')) {
          Get.snackbar("Error", "Phone number already exists");
        } else if (errorMessage.contains('Profile already exists')) {
          Get.snackbar("Error", errorMessage);
          Get.offNamedUntil(RoutesName.healthQuestionScreen, (route) => false);
        } else {
          Get.snackbar("Error", errorMessage);
        }
      } else {
        // Fallback for unexpected responses
        Get.snackbar("Error", "Unexpected response received");
      }
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    addressController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    ageController.dispose();
    heightController.dispose();
    currentWeightController.dispose();
    goalWeightController.dispose();
    currentBodyFatController.dispose();
    goalBodyFatController.dispose();
    super.onClose();
  }
}
