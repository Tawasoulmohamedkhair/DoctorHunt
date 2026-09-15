import 'package:doctor_hunt/apps/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.auth;
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
            //SizedBox(height: 100.h),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: const Color(0xff0EBE7F),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          if (LocaleSettings.currentLocale == AppLocale.en) {
                            LocaleSettings.setLocale(AppLocale.ar);
                          } else {
                            LocaleSettings.setLocale(AppLocale.en);
                          }
                        },
                        icon: const Icon(
                          Icons.language_rounded,
                          color: Color(0xff0EBE7F),
                          size: 18,
                        ),
                        label: Text(
                          LocaleSettings.currentLocale == AppLocale.en
                              ? 'العربية'
                              : 'English',
                          style: TextStyle(
                            color: const Color(0xff0EBE7F),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ),
                  ),
                  AuthTitleWidget(
                    title: t.signUpTitle,
                    description: t.createAccountDescription,
                  ),
                  SizedBox(height: 67.h),

                  Row(
                    children: [
                      SocialMediaWidget(
                        image: Image.asset('assets/images/google.png'),
                        text: t.google,
                      ),
                      SizedBox(width: 12.w),
                      SocialMediaWidget(
                        image: Image.asset('assets/images/facebook.png'),
                        text: t.facebook,
                      ),
                    ],
                  ),
                  SizedBox(height: 34.h),

                  AppTextField(
                    hintText: t.name,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.entername;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.h),

                  AppTextField(
                    hintText: t.email,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.enterEmail;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.h),

                  AppTextField(
                    hintText: t.password,
                    type: AppTextFieldType.password,

                    suffixIcon: Icon(Icons.visibility_off),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.enterPassword;
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
                      Expanded(child: Text(t.agreeAndPrivacy)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            CustomElevatedButton(
              label: Text(t.signUp),
              onPressed: () => const LoginRoute().go(context),
            ),
            RichTextWidget(
              text1: t.haveAccount,
              text2: t.logIn,
              onTap: () => const LoginRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}
