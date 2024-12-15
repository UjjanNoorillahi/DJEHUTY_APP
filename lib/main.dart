import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/getx_localization/languages.dart';
import 'package:getx_mvvm/res/routes/routes.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  checkUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userId = sp.getString('userId');
    debugPrint('User ID in main: $userId');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff175232)),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        // home: Splash,
        initialRoute: RoutesName.getStartedScreen,
        getPages: AppRoutes.appRoutes()
        // home: AppRoutes.appRoutes()
        );
  }
}
