import 'package:anything_ai/helpers/globals.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Lottie.asset(
      "assets/lottie/loading.json",
      width: mq.width * 0.4,
    );
  }
}
