import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/auth/cubit/auth_state.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_bottom_sheet.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/verify_code_bottom_sheet.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/reset_password_bottom_sheet.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // ==================================
        // Forgot Password Success
        // ==================================

        if (state.status == AuthStatus.forgotPasswordSuccess) {
          showVerifyCodeBottomSheet(
            context,
            onPressed: (code) {
              Navigator.pop(context);

              context.read<AuthCubit>().verifyCode(code: code);
            },
          );
        }

        // ==================================
        // Verify Code Success
        // ==================================

        if (state.status == AuthStatus.verifyCodeSuccess) {
          showResetPasswordBottomSheet(
            context,
            onPressed: (password) {
              Navigator.pop(context);

              context.read<AuthCubit>().resetPassword(password: password);
            },
          );
        }

        // ==================================
        // Reset Password Success
        // ==================================

        if (state.status == AuthStatus.resetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(t.auth.passwordSuccess)),
          );
        }

        // ==================================
        // Failure
        // ==================================

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? t.auth.somethingwentwrong),
            ),
          );
        }
      },

      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),

            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                AuthTitleWidget(
                  title: t.auth.welcome,
                  description: t.auth.loginDescription,
                ),
                SizedBox(height: 67.h),
                Row(
                  children: [
                    SocialMediaWidget(
                      image: Image.asset('assets/images/google.png'),
                      text: t.auth.google,
                    ),
                    SizedBox(width: 12.w),
                    SocialMediaWidget(
                      image: Image.asset('assets/images/facebook.png'),
                      text: t.auth.facebook,
                    ),
                  ],
                ),
                SizedBox(height: 34.h),
                AppTextField(
                  hintText: t.auth.email,
                  suffixIcon: Icon(Icons.check),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.auth.enterEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18.h),

                AppTextField(
                  hintText: t.auth.password,
                  type: AppTextFieldType.password,

                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.visibility_off),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.auth.enterPassword;
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    showAuthBottomSheet(
                      context,
                      title: t.auth.forgotPassword,
                      description:
                          t.auth.emailVerification,
                      hintText: t.auth.email,
                      buttonText: t.common.kContinue,

                      // ==========================
                      // Email Submitted
                      // ==========================
                      onPressed: (email) {
                        Navigator.pop(context);

                        context.read<AuthCubit>().forgotPassword(email: email);
                      },
                    );
                  },
                  child: Text(
                    t.auth.forgotPassword,
                    style: TextStyle(color: const Color(0xff0EBE7F)),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomElevatedButton(
                  label: Text(t.auth.logIn),
                  onPressed: () {},
                ),
                SizedBox(height: 54.h),

                RichTextWidget(
                  text1: t.auth.doNotHaveAccount,
                  text2: t.auth.join,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
