import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getx_mvvm/view/auth/login_screen/login_screen.dart';

class Getstartedscreen extends StatefulWidget {
  const Getstartedscreen({super.key});

  @override
  State<Getstartedscreen> createState() => _GetstartedscreenState();
}

class _GetstartedscreenState extends State<Getstartedscreen> {
  @override
  void initState() {
    //

    // timer
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    });

    super.initState();
  }

  // init() {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SvgPicture.asset('assets/images/splash_screen.svg'),
                  SizedBox(height: screenHeight * 0.32),
                  Container(
                      // flex: 6,
                      child: Image.asset('assets/images/splash.png')),
                  SizedBox(height: screenHeight * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DJEHUTY ',
                        style: TextStyle(
                            color: Color(0xff175232),
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Poppins',
                            fontSize: 20),
                      ),
                      Text(
                        'Stay Healthy and Fit',
                        style: TextStyle(
                            color: Color(0xff175232),
                            // fontFamily: 'Poppins',
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // GetStartedButton(
                  //   title: 'Let\'s get started',
                  //   onPressed: () {
                  //     // Get.toNamed('/signin');
                  //     // Navigator.pushAndRemoveUntil(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: (context) => LoginScreen()));
                  //
                  //
                  //   },
                  // ),
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

class GetStartedButton extends StatelessWidget {
  final title;
  final VoidCallback onPressed;
  const GetStartedButton(
      {super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff3A9864),
          borderRadius: BorderRadius.circular(45),
        ),
        width: 200,
        height: 50,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
