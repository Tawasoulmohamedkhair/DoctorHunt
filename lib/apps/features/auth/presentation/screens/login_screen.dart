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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const SnackBar(content: Text('Password reset successfully')),
          );
        }

        // ==================================
        // Failure
        // ==================================

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Something went wrong'),
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
                  title: 'Welcome back',
                  description:
                      'You can search c ourse, apply course and find scholarship for abroad studies',
                ),
                SizedBox(height: 67.h),
                Row(
                  children: [
                    SocialMediaWidget(
                      image: Image.asset('assets/images/google.png'),
                      text: 'Google',
                    ),
                    SizedBox(width: 12.w),
                    SocialMediaWidget(
                      image: Image.asset('assets/images/facebook.png'),
                      text: 'Facebook',
                    ),
                  ],
                ),
                SizedBox(height: 34.h),
                AppTextField(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.check),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18.h),

                AppTextField(
                  hintText: 'Password',
                    type: AppTextFieldType.password,

                  suffixIcon: GestureDetector(
                    onTap: (){

                    },
                    child: Icon(Icons.visibility_off)),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    showAuthBottomSheet(
                      context,
                      title: 'Forgot Password?',
                      description:
                          'Enter your email for the verification process. '
                          'We will send a 4 digits code to your email.',
                      hintText: 'Email',
                      buttonText: 'Continue',

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
                    'Forgot password',
                    style: TextStyle(color: const Color(0xff0EBE7F)),
                  ),
                ),
                SizedBox(height: 32.h),
                CustomElevatedButton(label: Text('Login'), onPressed: () {}),
                SizedBox(height: 54.h),

                RichTextWidget(
                  text1: 'Don’t have an account?',
                  text2: '  Join us',
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
