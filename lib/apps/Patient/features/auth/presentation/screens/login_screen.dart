import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/extension/validator_extension.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit_state.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_bottom_sheet.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/reset_password_bottom_sheet.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/social_media_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/verify_code_bottom_sheet.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final UserRole role;

  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _recoveryEmail;

  bool get isPatient => widget.role == UserRole.patient;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    context.read<AuthCubit>().login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  void _onForgotPasswordPressed() {
    showAuthBottomSheet(
      context,
      title: t.forgotPassword,
      description: t.emailVerification,
      hintText: t.email,
      buttonText: t.kContinue,
      validator: (value) => value.validateEmail(
        emptyMessage: t.enterEmail,
        invalidMessage: t.enterValidEmail,
      ),
      onPressed: (email) {
        Navigator.pop(context);
        context.read<AuthCubit>().forgotPassword(email: email);
      },
    );
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.danger : AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.success:
            const HomeRoute().go(context);
            break;

          case AuthStatus.forgotPasswordSuccess:
            final email = _recoveryEmail;
            if (email == null || email.isEmpty) {
              _showMessage(t.somethingwentwrong, isError: true);
              return;
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;

              showVerifyCodeBottomSheet(
                context,
                onPressed: (code) {
                  Navigator.of(context).pop();
                  context.read<AuthCubit>().verifyRecoveryCode(
                    email: email,
                    code: code.trim(),
                  );
                },
              );
            });
            break;

          case AuthStatus.verifyCodeSuccess:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;

              showResetPasswordBottomSheet(
                context,
                onPressed: (password) {
                  Navigator.of(context).pop();
                  context.read<AuthCubit>().resetPassword(password: password);
                },
              );
            });
            break;

          case AuthStatus.resetPasswordSuccess:
            _showMessage(t.passwordSuccess);
            break;

          case AuthStatus.failure:
            _showMessage(
              state.errorMessage ?? t.somethingwentwrong,
              isError: true,
            );
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        body: AuthBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: context.h(40)),

                    AuthTitleWidget(
                      title: t.welcome,
                      description: t.loginDescription,
                    ),

                    SizedBox(height: context.h(40)),

                    SocialMediaWidget(
                      onGooglePressed: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                    ),

                    SizedBox(height: context.h(28)),

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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.enterPassword;
                        }
                        return null;
                      },
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: _onForgotPasswordPressed,
                        child: Text(
                          t.forgotPassword,
                          style: context.regular14primary,
                        ),
                      ),
                    ),

                    SizedBox(height: context.h(24)),

                    // Login button
                    BlocBuilder<AuthCubit, AuthCubitState>(
                      builder: (context, state) {
                        final isLoading = state.status == AuthStatus.loading;

                        return CustomElevatedButton(
                          onPressed: isLoading ? null : _onLoginPressed,
                          label: isLoading
                              ? SizedBox(
                                  width: context.w(22),
                                  height: context.h(22),
                                  child: const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : Text(t.logIn, style: context.medium18white),
                        );
                      },
                    ),

                    SizedBox(height: context.h(32)),

                    // Patient only
                    if (isPatient)
                      RichTextWidget(
                        text1: t.doNotHaveAccount,
                        text2: t.join,
                        onTap: () => const SignUpRoute().go(context),
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
