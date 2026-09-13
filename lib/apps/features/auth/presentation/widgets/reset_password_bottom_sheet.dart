import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/app_text_field.dart';
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
    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        24.h,
        20.w,
        MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff333333),
            ),
          ),

          SizedBox(height: 8.h),

          // Description
          Text(
            'Create a new password for your account.',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff677294),
              height: 1.5,
            ),
          ),

          SizedBox(height: 24.h),

          // New Password
          AppTextField(
            controller: passwordController,
            type: AppTextFieldType.password,

            hintText: 'New Password',
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
                color: const Color(0xff677294),
              ),
            ),
            border: Border.all(
              color: const Color(0xff677294).withValues(alpha: .16),
              width: 1.w,
            ),
          ),

          SizedBox(height: 16.h),

          // Confirm Password
          AppTextField(
            controller: confirmPasswordController,
            type: AppTextFieldType.password,

            hintText: 'Confirm Password',
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
                color: const Color(0xff677294),
              ),
            ),
            border: Border.all(
              color: const Color(0xff677294).withValues(alpha: .16),
              width: 1.w,
            ),
          ),

          SizedBox(height: 24.h),

          // Reset Button
          CustomElevatedButton(
            label: const Text('Reset Password'),
            onPressed: () {
              final password = passwordController.text.trim();

              final confirmPassword = confirmPasswordController.text.trim();

              if (password.isEmpty || confirmPassword.isEmpty) {
                return;
              }

              if (password != confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Passwords do not match')),
                );
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
    backgroundColor: Colors.transparent,
    builder: (_) {
      return ResetPasswordBottomSheet(onPressed: onPressed);
    },
  );
}
