import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
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
            t.auth.enterDigit,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff333333),
            ),
          ),

          SizedBox(height: 8.h),

          // Description
          Text(
            t.auth.enterReceivedDigit,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff677294),
              height: 1.5,
            ),
          ),

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
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff333333),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff677294).withValues(alpha: .16),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 65.w,
              height: 55.h,
              textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff333333),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff0EBE7F),
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Resend
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                t.common.resencode,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0EBE7F),
                ),
              ),
            ),
          ),

          SizedBox(height: 8.h),

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
    backgroundColor: Colors.transparent,
    builder: (_) {
      return VerifyCodeBottomSheet(onPressed: onPressed);
    },
  );
}
