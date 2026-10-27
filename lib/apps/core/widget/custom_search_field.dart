import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widget/custom_app_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(16),
        vertical: context.h(8),
      ),
      child: CustomAppTextField(
        hintText: hintText,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            controller.clear();
            onClear?.call();
          },
        ),
      ),
    );
  }
}
