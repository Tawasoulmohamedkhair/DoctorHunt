import 'dart:io';

import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/admin_model.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class AdminProfileImage extends StatelessWidget {
  final AdminModel? profile;
  final File? selectedImageFile;
  final VoidCallback? onTap;
  final String tapPhotoText;

  const AdminProfileImage({
    super.key,
    required this.profile,
    required this.selectedImageFile,
    required this.onTap,
    required this.tapPhotoText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppImage(
            imageFile: selectedImageFile,
            imageUrl: profile?.avatarUrl,
            width: context.r(100),
            height: context.r(100),
            shape: AppImageShape.circle,
            backgroundColor: AppColors.white,
            fallback: Image.asset(
              Assets.images.profile.path,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.h(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.photo),
              SizedBox(width: context.w(8)),
              Text(tapPhotoText),
            ],
          ),
        ],
      ),
    );
  }
}
