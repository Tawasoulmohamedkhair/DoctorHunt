import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AdminProfileSaveButton extends StatelessWidget {
  final bool isSaving;
  final String label;
  final VoidCallback onPressed;

  const AdminProfileSaveButton({
    super.key,
    required this.isSaving,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: isSaving ? null : onPressed,
      label: isSaving
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(label),
      icon: isSaving ? null : const Icon(Icons.check),
    );
  }
}
