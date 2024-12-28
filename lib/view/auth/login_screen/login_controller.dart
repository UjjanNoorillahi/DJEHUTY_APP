import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../repository/login_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../user_preference/user_preference_controller.dart';
import '../../../utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;
  RxBool isLogIn = true.obs;

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  RxString roleController = 'STUDENT'.obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final usernameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final roleFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  void toggleLoginSignup() {
    isLogIn.value = !isLogIn.value;
    emailController.value.clear();
    usernameController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
    firstNameController.value.clear();
    lastNameController.value.clear();
  }

  void loginApi() {
    loading.value = true;
    print('inside loginApi');
    Map<String, String> data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    print("Data: $data");
    _api.loginApi(data).then(
      (value) {
        print("Value =======> $value");

        if (value['status'].toString() == 'success') {
          UserModel userModel = UserModel(
            user: User.fromJson(value['data']),
            roleName: value['data']['roleName'],
            isLogin: true,
          );
          print("UserModel =======> ${userModel.toJson()}");
          userPreference.saveUser(userModel).then(
            (value) {
              // Get.toNamed(RouteName.homeScreen);
            },
          ).onError((error, stackTrace) {});

          Map<String, String> dataTOCheckStatus = {
            'userId': value['data']['userId']
          };
          _api.checkScreenStatus(dataTOCheckStatus).then((onValue) {
            print("onValue... =======> $onValue");
            loading.value = false;
            if (onValue['data']['screen'] == 'UserProfileScreen') {
              Get.offNamedUntil(RoutesName.userProfile, (route) => false);
              Utils.snackBar('Login', 'Login Successfully');
              toggleLoginSignup();
            } else if (onValue['data']['screen'] == 'HealthScreen') {
              Get.offNamedUntil(
                  RoutesName.healthQuestionScreen, (route) => false);
              Utils.snackBar('Login', 'Login Successfully');
              toggleLoginSignup();
            } else if (onValue['data']['screen'] == 'InterviewScreen') {
              Get.offNamedUntil(
                  RoutesName.interviewQuestions, (route) => false);
              Utils.snackBar('Login', 'Login Successfully');
              toggleLoginSignup();
            } else {
              Get.offNamedUntil(RoutesName.homeScreen, (route) => false);
              Utils.snackBar('Login', 'Login Successfully');
              toggleLoginSignup();
            }
          });
        } else {
          String errorMessage = value['message'] ?? 'Unknown error occurred';
          Utils.snackBar('Error', errorMessage);
          // Utils.toastMessage(errorMessage);
        }
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snackBar('Error', 'Invalid credentials');
        print("Error =======> $error");
        // Utils.toastMessage(error.toString());
      },
    );
  }

  Future<void> signupApi() async {
    loading.value = true;
    print(roleController.value);
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "firstname": firstNameController.value.text,
      "lastname": lastNameController.value.text,
      "username": usernameController.value.text,
      "role": '673ed2f95775804943a27fdc'
    };

    final response = await _api.signupApi(data);

    final email = emailController.value.text;
    if (response['status'] == 'success') {
      Utils.snackBar('Signup', 'Signup Successful');
      toggleLoginSignup();
      loading.value = false;
      Get.offNamedUntil(
          RoutesName.phoneVerificationScreen,
          arguments: email,
          (route) => false);
    } else if (response['status'] == 'error') {
      loading.value = false;

      if (response['message'].toString().contains('duplicate key')) {
        Utils.snackBar('Error', 'Username already exists');
      } else
        Utils.snackBar('Error', response['message']);
    }

    print("Response =======> $response");

    // _api.signupApi(data).then(
    //   (value) {
    //     loading.value = false;
    //     // Handle signup success, if needed
    //     Utils.snackBar('Signup', 'Signup Successful');
    //     // Utils.toastMessage('Signup Successful');
    //     String email = emailController.value.text;
    //     toggleLoginSignup();
    //     // Navigate to another screen after successful signup
    //     Get.toNamed(RoutesName.phoneVerificationScreen, arguments: email);
    //
    //     // Navigator.push(
    //     //     context,
    //     //     MaterialPageRoute(
    //     //         builder: (context) => PhoneVerificationScreen(
    //     //               email: emailController.value.text,
    //     //             )));
    //   },
    // ).onError(
    //   (error, stackTrace) {
    //     loading.value = false;
    //
    //     // Handle signup error
    //     // Utils.snackBar('Error', error.toString());
    //     // Utils.toastMessage(error.toString());
    //     if (error.toString().contains('400')) {
    //       Utils.snackBar('Error', 'Email already exists');
    //       toggleLoginSignup();
    //     } else if (error.toString().contains('500')) {
    //       Utils.snackBar('Error', 'Duplicate username');
    //     } else {
    //       Utils.snackBar('Error', 'Unknown error occurred');
    //     }
    //   },
    // );
  }
}
