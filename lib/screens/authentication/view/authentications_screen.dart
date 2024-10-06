import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/constants/stringconstants.dart';
import 'package:lingopanda_assignment/core/constants/theme.dart';
import 'package:lingopanda_assignment/core/utils/validators.dart';
import 'package:lingopanda_assignment/screens/authentication/viewmodel/signin_viewModel.dart';
import 'package:lingopanda_assignment/screens/authentication/viewmodel/signup_viewModel.dart';
import 'package:lingopanda_assignment/widgets/custom_textfield.dart';
import 'package:lingopanda_assignment/widgets/custombutton.dart';
import 'package:provider/provider.dart';

enum AuthenticationScreenType {
  signin,
  signup,
}

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key, this.screenType = AuthenticationScreenType.signup});
  final AuthenticationScreenType screenType;
  static const String routeName = "/authentication";

  @override
  Widget build(BuildContext context) {
    debugPrint("$screenType");

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.eShop,
                style: TextStyles.poppinBold.copyWith(
                  fontSize: 22,
                  color: ColorConstants.blueShadeColor,
                ),
              ),
              const Spacer(flex: 4),
              formWidget(context: context, type: screenType),
              const Spacer(flex: 7),
              bottomWidget(context: context, type: screenType),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget({required BuildContext context, required AuthenticationScreenType type}) {
    if (type == AuthenticationScreenType.signup) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SignUpViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  height: 50,
                  width: 250,
                  borderRadius: 8,
                  label: StringConstants.signUp,
                  onPressed: () {
                    value.signUp(context: context);
                  },
                  isLoading: value.signUpLoading,
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstants.alreadyHaveAnAccount,
                  style: TextStyles.poppinMedium.copyWith(
                    fontSize: 16,
                    color: ColorConstants.textShadeColor,
                  ),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      routeName,
                      arguments: AuthenticationScreenType.signin,
                    );
                  },
                  child: Text(
                    StringConstants.login,
                    style: TextStyles.poppinMedium.copyWith(
                      fontSize: 16,
                      color: ColorConstants.blueShadeColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SignInViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  height: 50,
                  width: 250,
                  borderRadius: 8,
                  label: StringConstants.signIn,
                  onPressed: () {
                    value.signIn(context: context);
                  },
                  isLoading: value.signInLoading,
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstants.newHere,
                  style: TextStyles.poppinMedium.copyWith(
                    fontSize: 16,
                    color: ColorConstants.textShadeColor,
                  ),
                ),
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    StringConstants.signUp,
                    style: TextStyles.poppinMedium.copyWith(
                      fontSize: 16,
                      color: ColorConstants.blueShadeColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  Widget formWidget({required BuildContext context, required AuthenticationScreenType type}) {
    if (type == AuthenticationScreenType.signup) {
      return Consumer<SignUpViewModel>(
        builder: (context, provider, child) {
          return Container(
            child: Column(
              children: [
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: StringConstants.name,
                        controller: provider.nameController,
                        textInputType: TextInputType.name,
                        validator: FieldValidators.validateName,
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        label: StringConstants.email,
                        controller: provider.emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: FieldValidators.validateEmail,
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        label: StringConstants.password,
                        controller: provider.passwordController,
                        validator: FieldValidators.validatePassword,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Consumer<SignInViewModel>(
        builder: (context, provider, child) {
          return Container(
            child: Column(
              children: [
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: StringConstants.email,
                        controller: provider.emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: FieldValidators.validateEmail,
                      ),
                      const SizedBox(height: 18),
                      CustomTextField(
                        label: StringConstants.password,
                        controller: provider.passwordController,
                        validator: FieldValidators.validatePassword,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
