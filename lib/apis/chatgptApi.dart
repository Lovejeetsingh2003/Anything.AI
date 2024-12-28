import 'dart:convert';
import 'package:anything_ai/helpers/globals.dart';
import 'package:http/http.dart';

class ChatgptApi {
  static Future<void> getChatAnswer(String question) async {
    final url = Uri.parse(
        "https://free-chatgpt-api.p.rapidapi.com/chat-completion-one?prompt=hello");

    final headers = {
      "x-rapidapi-key": chatgptKey,
      "x-rapidapi-host": "free-chatgpt-api.p.rapidapi.com",
    };

    try {
      final response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        print("Response: ${response.body}");
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  static Future<Response?> getImage(String imageDesc) async {
    final url = Uri.parse("https://open-ai21.p.rapidapi.com/texttoimage2");

    final headers = {
      "x-rapidapi-key": "f6cb7a55a4msh1586308c0e5518bp1c1c3cjsne2abff75caed",
      "x-rapidapi-host": "open-ai21.p.rapidapi.com",
      "Content-Type": "application/json",
    };

    final body = jsonEncode({
      "text": imageDesc,
    });

    try {
      final response = await post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        return response;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
