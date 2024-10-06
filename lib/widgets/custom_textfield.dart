import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingopanda_assignment/core/constants/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    required this.controller,
    this.textInputType,
    required this.label,
    this.validator,
  });
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String label;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
      controller: controller,
      // maxLength: 1,
      maxLines: 1,
      style: TextStyles.poppinMedium.copyWith(color: ColorConstants.textShadeColor, fontSize: 16),
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: label,
        fillColor: ColorConstants.white,
        filled: true,
        hintStyle: TextStyles.poppinMedium.copyWith(color: ColorConstants.textShadeColor),
        errorStyle: TextStyles.poppinMedium.copyWith(
          color: Colors.red,
          letterSpacing: -0.30,
          height: 1.35,
        ),
        labelStyle: TextStyles.poppinRegular,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorConstants.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorConstants.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorConstants.white),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.white),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.only(left: 10, top: 10),
      ),
      textAlignVertical: TextAlignVertical.top,
      validator: validator,
    );
  }
}
