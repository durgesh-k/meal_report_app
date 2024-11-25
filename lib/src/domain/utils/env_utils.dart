import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvUtils {
  static Future<String> getTokenFromENV() async {
    await dotenv.load(fileName: ".env");
    return dotenv.env['API_TOKEN'] ?? "";
  }
}
