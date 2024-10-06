import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/screens/home/view/home_screen.dart';
import 'package:lingopanda_assignment/services/firebase/firebase_auth.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel() {
    formKey = GlobalKey();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool signInLoading = false;
  Future<void> signIn({required BuildContext context}) async {
    try {
      bool canSubmit = formKey.currentState?.validate() ?? false;
      if (!canSubmit) {
        return;
      }

      signInLoading = true;
      notifyListeners();

      bool success = await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );

      if (success) {
        emailController.clear();
        passwordController.clear();
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
      }
    } catch (e) {}

    signInLoading = false;
    notifyListeners();
  }

  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
