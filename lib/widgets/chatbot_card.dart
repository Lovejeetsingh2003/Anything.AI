import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../helpers/globals.dart';
import '../model/chatbot_type.dart';

class ChatbotCard extends StatelessWidget {
  final ChatbotType chatbotType;

  const ChatbotCard({super.key, required this.chatbotType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => chatbotType.onTap));
      },
      child: Card(
        color: ligh_blue.withOpacity(.2),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: chatbotType.leftAlign
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(chatbotType.img, width: mq.width * 0.35),
                  ),
                  Text(
                    chatbotType.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    chatbotType.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(chatbotType.img, width: mq.width * 0.30),
                  ),
                ],
              ),
      ),
    );
  }
}
