import 'dart:async';

import 'package:canteen_meal_report/src/controller/api/api_manager.dart';
import 'package:canteen_meal_report/src/domain/router/app_router.dart';
import 'package:canteen_meal_report/src/domain/utils/app_utils.dart';
import 'package:canteen_meal_report/src/domain/utils/logger_utils.dart';
import 'package:canteen_meal_report/src/presentation/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    Utils.getSplash(widgetsBinding);
    await apiManager.initialiseOptions();
    runApp(const MyMealReportApp());
    Utils.removeSplash();
  },
      (error, stack) => LoggerUtils.showError(error
          .toString())); // show error logs for the app, can also log in any crash logger service like Firebase Crashlytics
}

class MyMealReportApp extends StatelessWidget {
  const MyMealReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.unfocusOnFocusChanged(
          context), // to dismiss any open focus elements like keyboard etc. when tapped on empty area
      child: MaterialApp.router(
        title: 'Meal Report App',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Utils.navigatorKey,
        routerConfig: AppRouter.router,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
