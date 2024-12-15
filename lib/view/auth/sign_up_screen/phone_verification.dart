import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/widgets/reusable_button.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'phone_verification_controller.dart';

class PhoneVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = Get.arguments;
    final controller = Get.put(PhoneVerificationController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Back',
            style: TextStyle(color: Color(0xff4EB57D)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff4EB57D),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  'Phone Verification',
                  style: TextStyle(color: Color(0xff000000), fontSize: 20),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  'Enter 6 digit OTP Code',
                  style: TextStyle(color: Color(0xff7b7b7b)),
                ),
                SizedBox(height: screenHeight * 0.01),

                //     PinCodeTextField(
                //   onDone: (text) {
                //     controller.otpCode.value = text; // Final OTP when done
                //   },
                //   onTextChanged: (text) {
                //     controller.otpCode.value = text; // Update OTP dynamically
                //   },
                //   pinBoxHeight: 50,
                //   pinBoxWidth: 50,
                //   pinBoxRadius: 10,
                //   autofocus: true,
                //   pinBoxColor: const Color(0xff175232),
                //   pinBoxBorderWidth: 1,
                //   pinBoxOuterPadding:
                //       EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                //   defaultBorderColor: const Color(0xff175232),
                //   hasTextBorderColor: const Color(0xff7b7b7b),
                //   maxLength: 6, // Maximum length of OTP
                //   hasError: controller.otpCode.value.length < 6,
                //   pinTextStyle: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                //   keyboardType: TextInputType.number,
                //   // Show the cursor explicitly
                //   highlight:
                //       true, // Highlight the current box (cursor indicator)
                //   highlightColor: Colors.white, // Customize the cursor color
                //   highlightAnimation: true, // Enable cursor animation
                // ),

                Obx(
                  () => PinCodeTextField(
                    onDone: (text) {
                      controller.otpCode.value = text;
                      controller.verifyOtp(email);
                    },
                    pinBoxHeight: 50,
                    pinBoxWidth: 50,
                    pinBoxRadius: 10,
                    autofocus: true,
                    pinBoxColor: const Color(0xff175232),
                    pinBoxBorderWidth: 1,
                    pinBoxOuterPadding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                    defaultBorderColor: const Color(0xff175232),
                    hasTextBorderColor: const Color(0xff7b7b7b),
                    maxLength: 6,
                    hasError: controller.otpCode.value.length < 6,
                    pinTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    onTextChanged: (text) {
                      controller.otpCode.value = text;

                      print("OTP CODE: ${controller.otpCode.value}");
                      print("Email: ${email}");
                    },
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn\'t receive code? ',
                      style: TextStyle(color: Color(0xff7b7b7b)),
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.resendCode(email),
                        child: Text(
                          'Resend again',
                          style: TextStyle(
                            color: controller.isLoading.value
                                ? Colors.grey
                                : const Color(0xff175232),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Show error message if OTP is invalid or expired
                // Obx(
                //   () => controller.hasError.value
                //       ? Padding(
                //           padding: const EdgeInsets.only(top: 8.0),
                //           child: Text(
                //             controller.errorMessage.value,
                //             style: TextStyle(
                //               color: Colors.red,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         )
                //       : Container(),
                // ),
                SizedBox(height: screenHeight * 0.02),
                Image.asset('assets/images/verification.png'),
                Obx(
                  () => ReusableButton(
                    title:
                        controller.isLoading.value ? 'Verifying...' : 'Verify',
                    onPressed: () => controller.verifyOtp(email),
                    isLoading: controller.isLoading.value,
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
