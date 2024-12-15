import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/auth/login_screen/login_controller.dart';
import 'package:getx_mvvm/view/widgets/reusable_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _logInFormKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(LoginController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Back',
            style: TextStyle(
              color: Color(0xff4EB57D),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff4EB57D),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: _logInFormKey,
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: signUpController.firstNameController.value,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: signUpController.lastNameController.value,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: signUpController.usernameController.value,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller: signUpController.emailController.value,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
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
                  TextFormField(
                    controller: signUpController.passwordController.value,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // suffixIcon: Icon(
                      //   // Icons.visibility_off_outlined,
                      //   _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      //   color: Color(0xff7b7b7b),
                      // ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff7b7b7b),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    controller:
                        signUpController.confirmPasswordController.value,
                    obscureText: !_isRePasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Re-enter Password',
                      hintStyle: const TextStyle(
                        color: Color(0xff7b7b7b),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),

                      // suffixIcon: const Icon(
                      //   Icons.visibility_off_outlined,
                      //   color: Color(0xff7b7b7b),
                      // ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isRePasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff7b7b7b),
                        ),
                        onPressed: () {
                          setState(() {
                            _isRePasswordVisible = !_isRePasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Obx(() => ReusableButton(
                        title: 'Sign Up',
                        onPressed: () async {
                          if (signUpController.passwordController.value.text !=
                              signUpController
                                  .confirmPasswordController.value.text) {
                            Get.snackbar(
                              "Password Mismatch",
                              "Password and Confirm Password should be same",
                              backgroundColor: Color(0xff3A9864),
                              colorText: Colors.white,
                            );
                            return;
                          } else if (_logInFormKey.currentState!.validate()) {
                            signUpController.signupApi();
                            // loginController.toggleLoginSignup();
                          }
                        },
                        isLoading: signUpController.loading.value,
                      )),
                  SizedBox(height: screenHeight * 0.02),
                  RichText(
                    text: const TextSpan(
                      text: 'By continuing, you agreeing to our ',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms and conditions',
                          style: TextStyle(
                            color: Color(0xff3A9864),
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: ' and our privacy policies',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                  SizedBox(height: screenHeight * 0.02),
                  InkWell(
                    onTap: () {
                      // loginController.googleSignIn();
                      // snack bar to show sign in google will be added soon

                      Get.snackbar(
                        "In Progress",
                        "Google sign-up is currently unavailable as the client hasn't provided the required account details. This feature will be added soon.",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
