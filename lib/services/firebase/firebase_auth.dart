import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lingopanda_assignment/core/constants/stringconstants.dart';
import 'package:lingopanda_assignment/core/utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailVerification(context: context);
      showSnackBar(context: context, message: StringConstants.emailVerificationSent);

      // save details to firestore
      // Get the signed-in user
      User? user = userCredential.user;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      if (user != null) {
        Map<String, dynamic> userData = {
          'uid': user.uid,
          'email': user.email,
          'name': name,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await _firestore.collection('users').doc(user.uid).set(userData);
        print('User data stored successfully');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      showSnackBar(context: context, message: e.message);
    }

    return false;
  }

  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Checking if the current user is verified or not
      bool isEmailVerified = _auth.currentUser!.emailVerified;

      if (!isEmailVerified) {
        // Ask to verify email
        showSnackBar(context: context, message: StringConstants.pleaseVerifyEmailBeforeLogin);
        await sendEmailVerification(context: context);
        return false;
      }

      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, message: e.message);
    }
    return false;
  }

  Future<void> sendEmailVerification({required BuildContext context}) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, message: e.message);
    }
  }
}
