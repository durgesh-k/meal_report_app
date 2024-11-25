import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  static IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static addStringToSF(String key, String val) async {
    try {
      final storage = FlutterSecureStorage(
          aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
      await storage.write(
          key: key,
          value: val,
          aOptions: _getAndroidOptions(),
          iOptions: _getIOSOptions());
      LoggerUtils.showInfo("Added $val to $key in Secure Storage");
    } catch (e) {
      LoggerUtils.showError(e);
    }
  }

  static Future<String> getStringFromSF(String key) async {
    try {
      final storage = FlutterSecureStorage(
          aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
      String? value = await storage.read(
          key: key, aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
      LoggerUtils.showInfo("$key has value $value in Secure Storage");
      return value ?? '';
    } catch (e) {
      LoggerUtils.showError(e);
      return "";
    }
  }
}
