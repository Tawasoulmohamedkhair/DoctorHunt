import 'dart:io';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';

import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorImagePicker extends StatelessWidget {
  const DoctorImagePicker({
    super.key,
    this.selectedImageFile,
    this.imageUrl,
    this.onTap,
    this.isCreateMode = false,
  });

  final File? selectedImageFile;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isCreateMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: context.w(112),
            height: context.w(116),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: context.w(112),
                  height: context.w(112),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreys,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.borderMuted,
                      width: context.w(1),
                    ),
                  ),
                  child: AppImage(
                    imageFile: selectedImageFile,
                    imageUrl: imageUrl,
                    width: context.w(112),
                    height: context.w(112),
                    shape: AppImageShape.circle,
                    fit: BoxFit.cover,
                    backgroundColor: AppColors.lightGreys,
                    fallback: Image.asset(
                      Assets.images.profile.path,
                      width: context.w(112),
                      height: context.w(112),
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const Icon(Icons.person),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: context.w(32),
                    height: context.w(32),
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                        width: context.w(2),
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: AppColors.white,
                      size: context.r(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.h(4)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.photo_outlined,
                size: context.r(14),
                color: AppColors.success,
              ),
              SizedBox(width: context.w(6)),
              Text(
                isCreateMode ? t.tapPhotoToAdd : t.tapphoto,
                style: context.semiBoldPx12.copyWith(fontSize: context.sp(12), color: AppColors.success),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

