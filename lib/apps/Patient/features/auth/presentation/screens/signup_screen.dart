import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/language_switch_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/privacy_agreement_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.auth;
    return Scaffold(
      body: AuthBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LanguageSwitchButton(),
                  AuthTitleWidget(
                    title: t.signUpTitle,
                    description: t.createAccountDescription,
                  ),
                  SizedBox(height: 67.h),

                  SocialMediaWidget(),
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

                  const PrivacyAgreementWidget(),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            CustomElevatedButton(
              label: Text(t.signUp, style: context.medium18white),
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
