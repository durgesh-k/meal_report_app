import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:canteen_meal_report/src/domain/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';

abstract class Utils {
  static GlobalKey<ScaffoldMessengerState> navigatorKey =
      GlobalKey<ScaffoldMessengerState>();

  static unfocusOnFocusChanged(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static initializeSizeConfig(BuildContext context) {
    SizeConfig.initialize(context);
  }

  static getSplash(WidgetsBinding binding) {
    FlutterNativeSplash.preserve(widgetsBinding: binding);
  }

  static removeSplash() {
    FlutterNativeSplash.remove();
  }

  static String formatDate(String inputDate) {
    try {
      List<String> parts = inputDate.split('-');
      String year = parts[0];
      String month = parts[1].padLeft(2, '0'); // Ensure two-digit month
      String day = parts[2].padLeft(2, '0'); // Ensure two-digit day

      String normalizedDate = "$year-$month-$day";
      DateTime date = DateTime.parse(normalizedDate);
      String formattedDate = DateFormat('d MMMM y').format(date);

      return formattedDate;
    } catch (e) {
      LoggerUtils.showError(e);
      return "Invalid date";
    }
  }
}
