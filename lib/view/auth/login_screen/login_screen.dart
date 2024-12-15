import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/widgets/reusable_button.dart';

import '../sign_up_screen/sign_up.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _logInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    var _isPasswordVisible = false.obs;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Form(
            key: _logInFormKey,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Image.asset(
                  'assets/images/splash.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(height: screenHeight * 0.04),
                TextFormField(
                  controller: loginController.emailController.value,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(
                      color: Color(0xff7b7b7b),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(() => TextFormField(
                      controller: loginController.passwordController.value,
                      obscureText: !_isPasswordVisible.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                          color: Color(0xff7b7b7b),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff7b7b7b),
                          ),
                          onPressed: () {
                            _isPasswordVisible.value =
                                !_isPasswordVisible.value;
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    )),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.snackbar(
                        "In Progress",
                        "Forgot Password is currently unavailable This feature will be added soon.",
                        snackPosition: SnackPosition
                            .BOTTOM, // Adjust snackbar position if needed
                        duration: Duration(
                            seconds:
                                5), // Optional: Set how long the snackbar is visible
                        backgroundColor:
                            Color(0xff3A9864), // Optional: Style the snackbar
                        colorText: Colors
                            .white, // Optional: Adjust text color for readability
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Obx(() => ReusableButton(
                      title: 'Sign In',
                      onPressed: () async {
                        if (_logInFormKey.currentState!.validate()) {
                          loginController.loginApi();
                          // loginController.toggleLoginSignup();
                        }
                      },
                      isLoading: loginController.loading.value,
                    )),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 40),
                        height: 1,
                        color: const Color(0xff7b7b7b).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xff7b7b7b),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        // fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 40),
                        height: 1,
                        color: const Color(0xff7b7b7b).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                InkWell(
                  onTap: () {
                    // loginController.googleSignIn();
                    Get.snackbar(
                      "In Progress",
                      "Google sign-in is currently unavailable as the client hasn't provided the required account details. This feature will be added soon.",
                      snackPosition: SnackPosition
                          .BOTTOM, // Adjust snackbar position if needed
                      duration: Duration(
                          seconds:
                              5), // Optional: Set how long the snackbar is visible
                      backgroundColor:
                          Color(0xff3A9864), // Optional: Style the snackbar
                      colorText: Colors
                          .white, // Optional: Adjust text color for readability
                    );
                  },
                  child: Container(
                    // width: 300,
                    decoration: BoxDecoration(
                      // color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: const Color(0xff7b7b7b),
                      ),
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 22,
                            // fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  child: Row(
                    children: [
                      const Text(
                        'Don\'t have an account ? ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xff175232),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
