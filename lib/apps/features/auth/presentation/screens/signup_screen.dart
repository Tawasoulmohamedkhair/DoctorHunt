import 'package:doctor_hunt/apps/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthTitleWidget(
                    title: 'Join us to start searching',
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
                    hintText: 'Name',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.h),

                  AppTextField(
                    hintText: 'Email',

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

                    suffixIcon: Icon(Icons.visibility_off),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),

                  Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: Color(0xff677294).withValues(alpha: 0.50),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.done,
                          color: Color(0xff0EBE7F),
                          size: 10.h,
                        ),
                      ),
                      SizedBox(width: 11.w),
                      Expanded(
                        child: Text(
                          'I agree with the Terms of Service & Privacy Policy',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            CustomElevatedButton(
              label: Text('Sign Up'),
              onPressed: () => const LoginRoute().go(context),
            ),
            RichTextWidget(
              text1: 'Have an account?',
              text2: ' Log in',
              onTap: () => const LoginRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}
