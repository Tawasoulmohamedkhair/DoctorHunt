import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widget/custom_app_text_field.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return SizedBox(
      height: context.h(52),
      child: GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: CustomAppTextField(
            type: AppTextFieldType.search,
            hintText: t.search_hint,
            prefixIcon: const Icon(Icons.search),
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
    );
  }
}
