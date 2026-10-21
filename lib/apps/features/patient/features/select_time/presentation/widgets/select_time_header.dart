import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SelectTimeHeader extends StatelessWidget {
  const SelectTimeHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(16),
        vertical: context.h(12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          Expanded(
            child: Text(
              t.selecttime,
              textAlign: TextAlign.center,
              style: context.semiBoldPx20,
            ),
          ),
          SizedBox(width: context.w(48)),
        ],
      ),
    );
  }
}
