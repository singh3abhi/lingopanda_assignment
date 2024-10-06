import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/routes.dart';
import 'package:lingopanda_assignment/firebase_options.dart';
import 'package:lingopanda_assignment/screens/authentication/view/authentications_screen.dart';
import 'package:lingopanda_assignment/screens/authentication/viewmodel/signin_viewModel.dart';
import 'package:lingopanda_assignment/screens/authentication/viewmodel/signup_viewModel.dart';
import 'package:lingopanda_assignment/screens/home/view/home_screen.dart';
import 'package:lingopanda_assignment/screens/home/viewmodel/home_viewModel.dart';
import 'package:lingopanda_assignment/screens/splash/view/splash_screen.dart';
import 'package:lingopanda_assignment/screens/splash/viewmodel/splashscreen_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    debugPrint("$firebaseUser");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Lingopanda_assignment',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthStateHandler(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

class AuthStateHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen();
        }
        return AuthenticationScreen();
      },
    );
  }
}
