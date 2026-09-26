import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class AuthBottomSheet extends StatefulWidget {
  final String title;
  final String description;
  final String hintText;
  final String buttonText;
  final Widget? fieldSuffix;
  final String? Function(String?)? validator;
  final void Function(String value) onPressed;

  const AuthBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.hintText,
    required this.buttonText,
    this.fieldSuffix,
    this.validator,
    required this.onPressed,
  });

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() != true) return;

    final value = _controller.text.trim();
    if (value.isEmpty) return;

    widget.onPressed(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.w(20),
        right: context.w(20),
        top: context.h(24),
        bottom: MediaQuery.viewInsetsOf(context).bottom + context.h(24),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: context.w(40),
                height: context.h(4),
                decoration: BoxDecoration(
                  color: AppColors.darkgray,
                  borderRadius: BorderRadius.circular(context.r(10)),
                ),
              ),
            ),
            SizedBox(height: context.h(24)),

            Text(widget.title, style: context.medium24black),
            SizedBox(height: context.h(8)),

            Text(widget.description, style: context.regular14textSub),
            SizedBox(height: context.h(24)),

            AppTextField(
              controller: _controller,
              hintText: widget.hintText,
              type: AppTextFieldType.email,
              suffixIcon: widget.fieldSuffix,
              validator: widget.validator,
              textInputAction: TextInputAction.done,
              onChanged: (_) {}, // لو حابة تفعّلي الزر لاحقًا
            ),
            SizedBox(height: context.h(24)),

            CustomElevatedButton(
              label: Text(widget.buttonText),
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}

void showAuthBottomSheet(
  BuildContext context, {
  required String title,
  required String description,
  required String hintText,
  required String buttonText,
  Widget? fieldSuffix,
  String? Function(String?)? validator,
  required void Function(String value) onPressed,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(context.r(24))),
    ),
    builder: (_) {
      return AuthBottomSheet(
        title: title,
        description: description,
        hintText: hintText,
        buttonText: buttonText,
        fieldSuffix: fieldSuffix,
        validator: validator,
        onPressed: onPressed,
      );
    },
  );
}
