import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/auth/login_screen/login_screen.dart';
import 'package:getx_mvvm/view/auth/sign_up_screen/phone_verification.dart';
import 'package:getx_mvvm/view/getStartedScreen.dart';
import 'package:getx_mvvm/view/home_screens/home.dart';
import 'package:getx_mvvm/view/questions_screen/health_questions.dart';
import 'package:getx_mvvm/view/questions_screen/interview_questions.dart';
import 'package:getx_mvvm/view/user_profile/user_profile_screen.dart';

class AppRoutes {
  static appRoutes() => [
        //
        GetPage(
          name: RoutesName.getStartedScreen,
          page: () => const Getstartedscreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RoutesName.phoneVerificationScreen,
          page: () => PhoneVerificationScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: RoutesName.userProfile,
          page: () => UserProfileScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),

        GetPage(
          name: RoutesName.healthQuestionScreen,
          page: () => const HealthQuestionsScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        ),

        GetPage(
          name: RoutesName.interviewQuestions,
          page: () => InterviewQuestionsScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.noTransition,
        )
      ];
}
