import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBottomSheet extends StatefulWidget {
  final String title;
  final String description;
  final String hintText;
  final String buttonText;

  final Widget? fieldPrefix;
  final Widget? fieldSuffix;

  final String? Function(String?)? validator;

  final void Function(String value) onPressed;

  const AuthBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.hintText,
    required this.buttonText,
    this.fieldPrefix,
    this.fieldSuffix,
    this.validator,
    required this.onPressed,
  });

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
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
                color: AppColors.darkgray,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(widget.title, style: context.medium24black),

          SizedBox(height: 8.h),

          // Description
          Text(widget.description, style: context.regular14textSub),

          SizedBox(height: 24.h),

          // Text Field
          AppTextField(
            controller: controller,
            hintText: widget.hintText,
            suffixIcon: widget.fieldSuffix,
            border: Border.all(color: AppColors.textSub, width: 1.w),
            validator: widget.validator,
          ),

          SizedBox(height: 24.h),

          // Button
          CustomElevatedButton(
            label: Text(widget.buttonText),
            onPressed: () {
              final value = controller.text.trim();

              if (value.isEmpty) {
                return;
              }

              widget.onPressed(value);
            },
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Show Auth Bottom Sheet
// ==========================================

void showAuthBottomSheet(
  BuildContext context, {
  required String title,
  required String description,
  required String hintText,
  required String buttonText,
  Widget? fieldPrefix,
  Widget? fieldSuffix,
  String? Function(String?)? validator,
  required void Function(String value) onPressed,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.textSub,
    builder: (_) {
      return AuthBottomSheet(
        title: title,
        description: description,
        hintText: hintText,
        buttonText: buttonText,
        fieldPrefix: fieldPrefix,
        fieldSuffix: fieldSuffix,
        validator: validator,
        onPressed: onPressed,
      );
    },
  );
}
