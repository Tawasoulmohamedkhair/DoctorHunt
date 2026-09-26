import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
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
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        24,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 24),

          // Title
          Text(t.enterDigit, style: context.medium24black),

          SizedBox(height: 8),

          // Description
          Text(t.enterReceivedDigit, style: context.regular14textSub),

          SizedBox(height: 24),

          // OTP
          Pinput(
            controller: codeController,
            length: 8,
            keyboardType: TextInputType.number,
            autofocus: true,
            defaultPinTheme: PinTheme(
              width: 65,
              height: 55,
              textStyle: context.bold26primary,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.textSub, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 65,
              height: 55,
              textStyle: context.medium15textSecondary,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.primary, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Continue
          CustomElevatedButton(
            label: Text(t.kContinue),
            onPressed: () {
              final code = codeController.text.trim();

              if (code.length != 8) {
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
