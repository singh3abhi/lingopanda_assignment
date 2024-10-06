import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/services/firebase/firebase_auth.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel() {
    formKey = GlobalKey();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool signUpLoading = false;
  Future<void> signUp({required BuildContext context}) async {
    try {
      bool canSubmit = formKey.currentState?.validate() ?? false;
      if (!canSubmit) {
        return;
      }

      signUpLoading = true;
      notifyListeners();

      bool success = await FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
        name: nameController.text,
      );

      if (success) {
        emailController.clear();
        nameController.clear();
        passwordController.clear();
      }
    } catch (e) {}

    signUpLoading = false;
    notifyListeners();
  }

  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
