import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_elevated_button.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final bool isFavorite;
  final bool showFee;
  final bool showButton;
  final String buttonLabel;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onButtonTap;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.isFavorite = false,
    this.showFee = false,
    this.showButton = false,
    this.buttonLabel = 'Book Now',
    this.onTap,
    this.onFavoriteTap,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: showButton ? context.h(170) : null,
        margin: EdgeInsets.only(bottom: context.h(12)),
        padding: EdgeInsets.all(context.w(showButton ? 12 : 11)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(context.r(8)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: showButton
            ? _buildDetailsCard(context)
            : _buildListCard(context),
      ),
    );
  }

  // Find Doctors and Popular Doctors

  Widget _buildListCard(BuildContext context) {
    final t = Translations.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Doctor image
        _buildDoctorImage(context, width: 82, height: 82),
        SizedBox(width: context.w(10)),

        // Name, specialty, and star icon
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doctor.fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.medium14textSecondary,
              ),
              SizedBox(height: context.h(5)),
              Text(
                localizeSpecialty(context, doctor.specialtyName),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.regular12primary,
              ),
              SizedBox(height: context.h(5)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (i) {
                  final rating = doctor.rating.clamp(0.0, 5.0);

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

        SizedBox(width: context.w(6)),

        // Favorite above rating and views
        SizedBox(
          width: context.w(100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFavoriteButton(context),

              SizedBox(height: context.h(8)),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: doctor.rating.toStringAsFixed(1),
                      style: context.medium14textSecondary,
                    ),
                    TextSpan(
                      text: ' (${doctor.reviewsCount} ${t.views})',
                      style: context.light13textSub,
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Doctor Details

  Widget _buildDetailsCard(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDoctorImage(context, width: 92, height: 87),
        SizedBox(width: context.w(12)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.medium14textSecondary,
                        ),
                        SizedBox(height: context.h(5)),
                        Text(
                          localizeSpecialty(context, doctor.specialtyName),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.regular12primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: context.w(8)),

                  _buildFavoriteButton(context),
                  SizedBox(height: context.h(8)),
                ],
              ),
              SizedBox(height: context.h(8)),

              Row(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        final rating = doctor.rating.clamp(0.0, 5.0);

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
                  ),
                  if (showFee) ...[
                    SizedBox(width: context.w(4)),
                    Flexible(
                      child: Text(
                        '\$${doctor.fee.toStringAsFixed(3)}/${t.hours}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: context.light13textSub,
                      ),
                    ),
                  ],
                ],
              ),

              SizedBox(height: context.h(8)),
              SizedBox(
                width: double.infinity,
                height: context.h(32),
                child: CustomElevatedButton(
                  onPressed: onButtonTap,
                  label: Text(
                    buttonLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.regular12textSub.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  height: 32,
                  width: 140,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorImage(
    BuildContext context, {
    required double width,
    required double height,
  }) {
    return AppImage(
      imageUrl: doctor.imageUrl,
      width: context.w(width),
      height: context.h(height),
      shape: AppImageShape.rectangle,
      borderRadius: context.r(8),
      fit: BoxFit.cover,
      backgroundColor: AppColors.grey.withValues(alpha: 0.15),
      fallback: Icon(Icons.person, size: context.sp(42), color: AppColors.grey),
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return InkWell(
      onTap: onFavoriteTap,
      customBorder: const CircleBorder(),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? AppColors.danger : AppColors.grey,
        size: context.sp(20),
      ),
    );
  }
}
