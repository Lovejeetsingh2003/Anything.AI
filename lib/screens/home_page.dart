import 'package:anything_ai/helpers/colors.dart';
import 'package:anything_ai/helpers/globals.dart';
import 'package:anything_ai/helpers/pref.dart';
import 'package:anything_ai/model/home_type.dart';
import 'package:anything_ai/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    // Api.getAnswer("what is the name of president and prime minister of india?");
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(
                Icons.brightness_4_rounded,
                size: 30,
                color: ligh_blue,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            appName,
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 25,
              color: ligh_blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .02, vertical: mq.width * .01),
          children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
        ));
  }
}
