import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/routes.dart';
import 'package:lingopanda_assignment/screens/splash/viewmodel/splashscreen_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    debugPrint("Splash Screen bUILD");

    final provider = Provider.of<SplashScreenViewModel>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
              child: Text("Splash}")),
        ),
      ),
    );
  }
}
