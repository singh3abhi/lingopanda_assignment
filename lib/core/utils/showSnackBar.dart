import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/constants/stringconstants.dart';

void showSnackBar({required BuildContext context, required String? message}) {
  message = message ?? StringConstants.defaultErrorMessage;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
