import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/screens/authentication/view/authentications_screen.dart';
import 'package:lingopanda_assignment/screens/home/view/home_screen.dart';
import 'package:lingopanda_assignment/screens/splash/view/splash_screen.dart';
import 'package:lingopanda_assignment/screens/splash/viewmodel/splashscreen_viewmodel.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    debugPrint("123 ${routeSettings.name}");

    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case AuthenticationScreen.routeName:
        final AuthenticationScreenType type = (routeSettings.arguments as AuthenticationScreenType?) ?? AuthenticationScreenType.signup;
        return MaterialPageRoute(
          builder: (context) => AuthenticationScreen(
            screenType: type,
          ),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        // This case should not appear but still added for safety
        return null;
    }
  }
}
