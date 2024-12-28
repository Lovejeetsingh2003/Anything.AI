import 'package:anything_ai/screens/image_creation_page.dart';
import 'package:flutter/widgets.dart';

enum ImageCreationType { dalle }

extension myImageCreationType on ImageCreationType {
  String get title => switch (this) {
        ImageCreationType.dalle => "Dall-e",
      };

  String get img => switch (this) {
        ImageCreationType.dalle => "assets/images/chatgpt.png",
      };

  bool get leftAlign => switch (this) {
        ImageCreationType.dalle => true,
      };
  Widget get onTap => switch (this) {
        ImageCreationType.dalle => const ImageCreationPage(title: "Dall-e"),
      };
}
