import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/screens/authentication/view/authentication_screen.dart';
import 'package:lingopanda_assignment/screens/home/view/home_screen.dart';
import 'package:lingopanda_assignment/screens/splash/view/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String authentication = "/authentication";
  static const String home = "/login";

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case authentication:
        return MaterialPageRoute(
          builder: (context) => const AuthenticationScreen(),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        // This case should not appear but still added for safety
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
