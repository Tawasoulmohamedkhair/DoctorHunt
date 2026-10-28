import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class PopularDoctorsSection extends StatelessWidget {
  final List<DoctorModel> doctors;
  final void Function(DoctorModel doctor)? onDoctorTap;
  final VoidCallback? onSeeAllTap;
  final bool Function(DoctorModel doctor)? isFavorite;
  final void Function(DoctorModel doctor)? onFavoriteTap;

  const PopularDoctorsSection({
    super.key,
    required this.doctors,
    this.onDoctorTap,
    this.onSeeAllTap,
    this.isFavorite,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Column(
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
              Text(t.popularDoctor, style: context.medium18textSecondary),
              Row(
                children: [
                  TextButton(
                    onPressed: onSeeAllTap,
                    child: Text(t.seeall, style: context.light12textSub),
                  ),
                  Icon(Icons.arrow_forward_ios, size: context.sp(16)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.isTablet || context.height < 500
              ? 220
              : context.h(251.2),
          child: doctors.isEmpty
              ? const Center(child: Text('لا يوجد أطباء لعرضهم حاليًا'))
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
                        width: context.w(180),
                        height: context.w(180) * 264 / 190,
                        margin: EdgeInsets.only(right: context.w(12)),
                        padding: EdgeInsets.all(context.w(8)),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(context.r(16)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                AppImage(
                                  imageUrl: doctor.imageUrl,
                                  width: context.w(150),
                                  height: context.h(130),
                                  shape: AppImageShape.rectangle,
                                  borderRadius: context.r(12),
                                  fallback: const Icon(
                                    Icons.medical_services,
                                    color: AppColors.borderMuted,
                                  ),
                                  showLoadingIndicator: true,
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: Material(
                                    color: AppColors.white,
                                    shape: const CircleBorder(),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: onFavoriteTap == null
                                          ? null
                                          : () => onFavoriteTap!(doctor),
                                      child: Padding(
                                        padding: EdgeInsets.all(context.w(5)),
                                        child: Icon(
                                          favorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: favorite
                                              ? Colors.red
                                              : AppColors.black,
                                          size: context.sp(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.h(10)),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                doctor.fullName,
                                style: context.medium18textSecondary,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: context.h(4)),
                            Text(
                              localizeSpecialty(context, doctor.specialtyName),
                              style: context.regular14textSub,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: context.h(6)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (i) {
                                final rating = doctor.rating.clamp(0, 5);

                                return Icon(
                                  i < rating.floor()
                                      ? Icons.star
                                      : i < rating
                                      ? Icons.star_half
                                      : Icons.star_border,
                                  color: AppColors.rating,
                                  size: context.sp(16),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
