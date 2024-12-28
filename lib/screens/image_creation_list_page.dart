import 'package:anything_ai/model/image_creation_type.dart';
import 'package:anything_ai/widgets/image_creation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/colors.dart';
import '../helpers/globals.dart';

class ImageCreationListPage extends StatefulWidget {
  const ImageCreationListPage({super.key});

  @override
  State<ImageCreationListPage> createState() => _ImageCreationListPageState();
}

class _ImageCreationListPageState extends State<ImageCreationListPage> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            "ChatBots",
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
          children: ImageCreationType.values
              .map((e) => ImageCreationCard(imageCreationType: e))
              .toList(),
        ));
  }
}
