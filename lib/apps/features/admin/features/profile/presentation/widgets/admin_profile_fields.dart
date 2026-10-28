import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:flutter/material.dart';

class AdminProfileFields extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController locationController;

  final String fullNameHint;
  final String emailHint;
  final String locationHint;

  final VoidCallback? onLocationTap;
  final bool locationReadOnly;

  const AdminProfileFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.locationController,
    required this.fullNameHint,
    required this.emailHint,
    required this.locationHint,
    this.onLocationTap,
    this.locationReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppTextField(
          controller: fullNameController,
          hintText: fullNameHint,
          textAlign: TextAlign.start,
          prefixIcon: const Icon(Icons.person),
        ),
        SizedBox(height: context.h(16)),
        CustomAppTextField(
          controller: emailController,
          type: AppTextFieldType.email,
          hintText: emailHint,
          prefixIcon: const Icon(Icons.email),
          readOnly: true,
        ),
        SizedBox(height: context.h(16)),
        CustomAppTextField(
          controller: locationController,
          hintText: locationHint,
          prefixIcon: const Icon(Icons.location_on_outlined),
          suffixIcon: IconButton(
            tooltip: 'Choose location on map',
            onPressed: onLocationTap,
            icon: const Icon(Icons.map_outlined),
          ),
          readOnly: locationReadOnly,
        ),
      ],
    );
  }
}
