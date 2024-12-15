import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/view/auth/login_screen/login_screen.dart';

class PhoneVerificationController extends GetxController {
  RxString otpCode = ''.obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxString errorMessage = ''.obs;

  final Dio _dio = Dio(); // Initialize Dio

  final String apiUrl = AppUrl.verifyOTP; // API URL

  // Function to handle OTP verification
  Future<void> verifyOtp(String email) async {
    if (otpCode.value.length == 6) {
      isLoading.value = true;

      print("email: $email");
      print("OTP CODE: ${otpCode.value}");

      try {
        // Sending the OTP request to the API
        final response = await _dio.post(
          apiUrl,
          data: {
            'email': email,
            'otp': otpCode.value,
          },
        );

        print("Response: ${response.data}");
        print("Status Code: ${response.statusCode}");
        if (response.statusCode == 200) {
          if (response.data['status'] == 'success') {
            // If OTP is valid, navigate to the UserProfile screen
            Get.off(() => LoginScreen());
          } else {
            // If OTP is invalid or expired, show an error message
            hasError.value = true;
            errorMessage.value = response.data['message'];
            Get.snackbar(
              "Error",
              "Invalid or expired OTP Code",
            );
          }
        } else {
          // Handle unexpected response
          hasError.value = true;
          errorMessage.value = 'Unexpected error occurred.';
          Get.snackbar(
            "Error",
            "Invalid or expired OTP Code",
          );
        }
      } catch (e) {
        // Handle network or other errors
        hasError.value = true;
        errorMessage.value = 'Network error occurred: $e';
        Get.snackbar(
          "Error",
          "Invalid or expired OTP Code",
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      hasError.value = true;
      errorMessage.value = 'Please enter a valid 6-digit OTP';
    }
  }

  // Function to handle resend OTP request
  Future<void> resendCode(String email) async {
    // Implement your resend OTP logic here (optional)
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar("Success", "OTP Code has been resent!",
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
