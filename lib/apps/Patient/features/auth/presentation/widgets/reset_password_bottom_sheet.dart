import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  final void Function(String password) onPressed;

  const ResetPasswordBottomSheet({super.key, required this.onPressed});

  @override
  State<ResetPasswordBottomSheet> createState() =>
      _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.auth;

    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        24.h,
        20.w,
        MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.textSub,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(t.reset, style: context.medium24black),

          SizedBox(height: 8.h),

          // Description
          Text(t.creatNewPassword, style: context.regular14textSub),

          SizedBox(height: 24.h),

          // New Password
          AppTextField(
            controller: passwordController,
            type: AppTextFieldType.password,

            hintText: t.newPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textSub,
              ),
            ),
            border: Border.all(color: AppColors.textSub, width: 1.w),
          ),

          SizedBox(height: 16.h),

          // Confirm Password
          AppTextField(
            controller: confirmPasswordController,
            type: AppTextFieldType.password,

            hintText: t.reenterPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textSub,
              ),
            ),
            border: Border.all(color: AppColors.textSub, width: 1.w),
          ),

          SizedBox(height: 24.h),

          // Reset Button
          CustomElevatedButton(
            label: Text(t.reset),
            onPressed: () {
              final password = passwordController.text.trim();

              final confirmPassword = confirmPasswordController.text.trim();

              if (password.isEmpty || confirmPassword.isEmpty) {
                return;
              }

              if (password != confirmPassword) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.passworddonotmatch)));
                return;
              }

              widget.onPressed(password);
            },
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Show Reset Password Bottom Sheet
// ==========================================

void showResetPasswordBottomSheet(
  BuildContext context, {
  required void Function(String password) onPressed,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.danger,
    builder: (_) {
      return ResetPasswordBottomSheet(onPressed: onPressed);
    },
  );
}
