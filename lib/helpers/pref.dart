import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box box;

  static Future<void> initialized() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    box = Hive.box(name: 'myData');
  }

  static bool get showOnBoarding =>
      box.get("showOnBoarding", defaultValue: true);
  static set showOnBoarding(bool v) => box.put("showOnBoarding", v);
}
