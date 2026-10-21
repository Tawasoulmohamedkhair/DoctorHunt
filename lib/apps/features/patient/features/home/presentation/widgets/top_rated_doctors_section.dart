import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class TopRatedDoctorsSection extends StatelessWidget {
  const TopRatedDoctorsSection({
    super.key,
    required this.doctors,
    this.onDoctorTap,
    this.onSeeAllTap,
    this.isFavorite,
    this.onFavoriteTap,
  });

  final List<DoctorModel> doctors;
  final void Function(DoctorModel doctor)? onDoctorTap;
  final VoidCallback? onSeeAllTap;
  final bool Function(DoctorModel doctor)? isFavorite;
  final void Function(DoctorModel doctor)? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.w(20),
            context.h(20),
            context.w(20),
            context.h(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.topRatedDoctors, style: context.medium18textSecondary),
              TextButton(
                onPressed: onSeeAllTap,
                child: Text(t.seeAll, style: context.light12textSub),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.height < 500 ? 175 : context.h(195),
          child: doctors.isEmpty
              ? const Center(child: Text('Ù„Ø§ ÙŠÙˆØ¬Ø¯ Ø£Ø·Ø¨Ø§Ø¡ Ù„Ø¹Ø±Ø¶Ù‡Ù… Ø­Ø§Ù„ÙŠÙ‹Ø§'))
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: context.w(16)),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    final favorite = isFavorite?.call(doctor) ?? false;

                    return GestureDetector(
                      onTap: () => onDoctorTap?.call(doctor),
                      child: Container(
                        width: context.w(130),
                        margin: EdgeInsets.only(right: context.w(12)),
                        padding: EdgeInsets.all(context.w(8)),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(context.r(16)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => onFavoriteTap?.call(doctor),
                                  child: Icon(
                                    favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: context.sp(17),
                                    color: favorite ? Colors.red : Colors.grey,
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: context.sp(12),
                                        color: AppColors.rating,
                                      ),
                                      SizedBox(width: context.w(2)),
                                      Flexible(
                                        child: Text(
                                          doctor.rating.toStringAsFixed(1),
                                          style: context.medium10textSecondary,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.h(5)),
                            SizedBox(
                              width: context.r(56),
                              height: context.r(56),
                              child: AppImage(
                                imageUrl: doctor.imageUrl,
                                width: context.w(56),
                                height: context.w(56),
                                shape: AppImageShape.circle,
                                fallback: const Icon(
                                  Icons.medical_services,
                                  color: Colors.grey,
                                  size: 28,
                                ),
                              ),
                            ),
                            SizedBox(height: context.h(4)),
                            Text(
                              doctor.fullName,
                              style: context.medium12textSecondary,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: context.h(2)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: context.h(20)),
      ],
    );
  }
}


