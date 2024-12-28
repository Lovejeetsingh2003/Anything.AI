import 'package:anything_ai/screens/chatbot_page.dart';
import 'package:anything_ai/screens/image_creation_list_page.dart';
import 'package:flutter/material.dart';

enum HomeType { aiChatbot, aiImageCreator, aiTranslator }

extension myHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatbot => "AI ChatBot",
        HomeType.aiImageCreator => "AI Image Creator",
        HomeType.aiTranslator => "Language Translator",
      };

  String get gif => switch (this) {
        HomeType.aiChatbot => "assets/lottie/chatbot.json",
        HomeType.aiImageCreator => "assets/lottie/image_generation.json",
        HomeType.aiTranslator => "assets/lottie/translator.json",
      };

  bool get leftAlign => switch (this) {
        HomeType.aiChatbot => true,
        HomeType.aiImageCreator => false,
        HomeType.aiTranslator => true,
      };

  Widget get onTap => switch (this) {
        HomeType.aiChatbot => const ChatbotPage(),
        HomeType.aiImageCreator => const ImageCreationListPage(),
        HomeType.aiTranslator => const ChatbotPage(),
      };
}
