import 'package:anything_ai/screens/chat_page.dart';
import 'package:flutter/widgets.dart';

enum ChatbotType { chatgpt }

extension mychatbotType on ChatbotType {
  String get title => switch (this) {
        ChatbotType.chatgpt => "ChatGpt",
      };

  String get img => switch (this) {
        ChatbotType.chatgpt => "assets/images/chatgpt.png",
      };

  bool get leftAlign => switch (this) {
        ChatbotType.chatgpt => true,
      };
  Widget get onTap => switch (this) {
        ChatbotType.chatgpt => const ChatPage(title: "ChatGpt"),
      };
}
