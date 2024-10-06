import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/constants/stringconstants.dart';
import 'package:lingopanda_assignment/core/constants/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.label,
    this.margin,
    this.padding,
    required this.borderRadius,
    required this.onPressed,
    this.isLoading = false,
  });
  final double? height;
  final double? width;
  final String label;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: ColorConstants.blueShadeColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: TextStyles.poppinBold.copyWith(
                  fontSize: 18,
                  color: ColorConstants.white,
                ),
              ),
      ),
    );
  }
}
