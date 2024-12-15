import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/auth/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to( LoginScreen());
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Getstartedscreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...'),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {



        },
        tooltip: '',
        child: const Icon(Icons.add),
      ),
    );
  }
}