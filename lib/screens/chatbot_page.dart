import 'package:anything_ai/model/chatbot_type.dart';
import 'package:anything_ai/widgets/chatbot_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/colors.dart';
import '../helpers/globals.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
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
          children: ChatbotType.values
              .map((e) => ChatbotCard(chatbotType: e))
              .toList(),
        ));
  }
}
