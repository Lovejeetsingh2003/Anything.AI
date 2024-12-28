import 'package:anything_ai/helpers/colors.dart';
import 'package:anything_ai/helpers/pref.dart';
import 'package:anything_ai/screens/home_page.dart';
import 'package:anything_ai/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import '../helpers/globals.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Pref.showOnBoarding ? const LoadingScreen() : const HomePage(),
        ),
      );
      // Get.off((context) =>
      //     Pref.showOnBoarding ? const LoadingScreen() : const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: mq.width * .4,
              width: mq.width * .4,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                appName,
                style: TextStyle(
                  letterSpacing: 10,
                  fontSize: 25,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
