import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/extension/validator_extension.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/language_switch_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/privacy_agreement_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _agreedToPrivacy = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state.status == AuthStatus.signUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.signUpSuccess),
              backgroundColor: AppColors.primary,
            ),
          );

          const LoginRoute(role: UserRole.patient).go(context);
        }

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? t.somethingwentwrong),
              backgroundColor: AppColors.danger,
            ),
          );
        }
      },
      child: Scaffold(
        body: AuthBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: context.w(4)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LanguageSwitchButton(),

                    AuthTitleWidget(
                      title: t.signUpTitle,
                      description: t.createAccountDescription,
                    ),

                    SizedBox(height: context.h(40)),

                    SocialMediaWidget(
                      onGooglePressed: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                    ),

                    SizedBox(height: context.h(28)),

                    // Name
                    AppTextField(
                      controller: _nameController,
                      hintText: t.name,
                      validator: (value) =>
                          value.validateName(emptyMessage: t.entername),
                    ),

                    SizedBox(height: context.h(16)),

                    // Email
                    AppTextField(
                      controller: _emailController,
                      hintText: t.email,
                      type: AppTextFieldType.email,
                      validator: (value) => value.validateEmail(
                        emptyMessage: t.enterEmail,
                        invalidMessage: t.enterValidEmail,
                      ),
                    ),

                    SizedBox(height: context.h(16)),

                    // Password
                    AppTextField(
                      controller: _passwordController,
                      hintText: t.password,
                      type: AppTextFieldType.password,
                      validator: (value) => value.validatePassword(
                        emptyMessage: t.enterPassword,
                        minLengthMessage: t.passwordMinLength,
                        lowerCaseMessage: t.passwordLowerCase,
                        upperCaseMessage: t.passwordUpperCase,
                        numberMessage: t.passwordNumber,
                        specialCharMessage: t.passwordSpecialChar,
                      ),
                    ),

                    SizedBox(height: context.h(12)),

                    // Privacy Agreement
                    PrivacyAgreementWidget(
                      value: _agreedToPrivacy,
                      onChanged: (value) {
                        setState(() {
                          _agreedToPrivacy = value;
                        });
                      },
                    ),

                    SizedBox(height: context.h(20)),

                    // Sign Up Button
                    BlocBuilder<AuthCubit, AuthCubitState>(
                      builder: (context, state) {
                        final isLoading = state.status == AuthStatus.loading;

                        return CustomElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  if (!_agreedToPrivacy) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(t.agreeAndPrivacy),
                                      ),
                                    );
                                    return;
                                  }

                                  context.read<AuthCubit>().signUp(
                                    fullName: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  );
                                },
                          label: isLoading
                              ? SizedBox(
                                  height: context.h(22),
                                  width: context.w(22),
                                  child: const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : Text(t.signUp, style: context.medium18white),
                        );
                      },
                    ),

                    SizedBox(height: context.h(16)),

                    RichTextWidget(
                      text1: t.haveAccount,
                      text2: t.logIn,
                      onTap: () =>
                          const LoginRoute(role: UserRole.patient).go(context),
                    ),

                    SizedBox(height: context.h(24)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
