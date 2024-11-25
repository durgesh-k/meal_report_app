import 'package:canteen_meal_report/src/domain/router/app_routes.dart';
import 'package:canteen_meal_report/src/presentation/screens/error/default_error_screen.dart';
import 'package:canteen_meal_report/src/presentation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
      initialLocation: '/home',
      errorBuilder: (context, state) {
        return const DefaultErrorScreen();
      },
      routes: [
        GoRoute(
          name: AppRoutes.home,
          path: '/home',
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
      ]);
}
