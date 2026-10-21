import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/app_image.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class FavoriteDoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onFavoriteTap;

  const FavoriteDoctorCard({
    super.key,
    required this.doctor,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 180,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE8EDF2)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onFavoriteTap,
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.danger,
                    size: 22,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImage(
                    imageUrl: doctor.imageUrl,
                    width: 70,
                    height: 70,
                    shape: AppImageShape.circle,
                    backgroundColor: AppColors.lightGreys,
                    fallback: const Icon(
                      Icons.person,
                      size: 35,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    doctor.fullName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.semiBoldPx13.copyWith(color: Color(0xFF252B40)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    localizeSpecialty(context, doctor.specialtyName),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.regularPx11.copyWith(color: AppColors.textSub),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

