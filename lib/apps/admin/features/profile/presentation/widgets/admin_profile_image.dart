import 'dart:io';

import 'package:doctor_hunt/apps/admin/data/model/admin_model.dart';
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
          CircleAvatar(
            radius: context.r(50),
            backgroundColor: Colors.white,
            backgroundImage: _getImageProvider(),
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

  ImageProvider _getImageProvider() {
    if (selectedImageFile != null) {
      return FileImage(selectedImageFile!);
    }

    final avatarUrl = profile?.avatarUrl;

    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      return NetworkImage(avatarUrl);
    }

    return AssetImage(Assets.images.profile.path);
  }
}
