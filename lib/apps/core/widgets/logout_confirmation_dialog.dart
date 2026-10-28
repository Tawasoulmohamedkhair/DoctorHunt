import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        t.logout,
        style: const TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w600),
      ),
      content: Text(
        t.confirmLogout,
        style: TextStyle(fontFamily: 'Rubik', color: Color(0xFF677294)),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child:  Text(
            t.cancel,
            style: TextStyle(fontFamily: 'Rubik', color: Color(0xFF677294)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child:  Text(
            t.ok,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xFF0EBE7F),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
