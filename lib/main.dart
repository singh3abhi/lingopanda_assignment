import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingopanda_assignment',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
