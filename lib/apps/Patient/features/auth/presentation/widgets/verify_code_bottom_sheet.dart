import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeBottomSheet extends StatefulWidget {
  final void Function(String code) onPressed;

  const VerifyCodeBottomSheet({super.key, required this.onPressed});

  @override
  State<VerifyCodeBottomSheet> createState() => _VerifyCodeBottomSheetState();
}

class _VerifyCodeBottomSheetState extends State<VerifyCodeBottomSheet> {
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
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
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(t.auth.enterDigit, style: context.medium24black),

          SizedBox(height: 8.h),

          // Description
          Text(t.auth.enterReceivedDigit, style: context.regular14textSub),

          SizedBox(height: 24.h),

          // OTP
          Pinput(
            controller: codeController,
            length: 4,
            keyboardType: TextInputType.number,
            autofocus: true,
            defaultPinTheme: PinTheme(
              width: 65.w,
              height: 55.h,
              textStyle: context.bold26primary,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.textSub, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 65.w,
              height: 55.h,
              textStyle: context.medium15textSecondary,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.primary, width: 1.5.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Continue
          CustomElevatedButton(
            label: Text(t.common.kContinue),
            onPressed: () {
              final code = codeController.text.trim();

              if (code.length != 4) {
                return;
              }

              widget.onPressed(code);
            },
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Show Verify Code Bottom Sheet
// ==========================================

void showVerifyCodeBottomSheet(
  BuildContext context, {
  required void Function(String code) onPressed,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.textDark,
    builder: (_) {
      return VerifyCodeBottomSheet(onPressed: onPressed);
    },
  );
}
