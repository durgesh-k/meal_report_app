import 'package:logger/web.dart';

abstract class LoggerUtils {
  static showFatal(Object e) {
    Logger().f(e);
  }

  static showError(Object e) {
    Logger().e(e);
  }

  static showDebug(Object e) {
    Logger().d(e);
  }

  static showInfo(Object e) {
    Logger().i(e);
  }
}
