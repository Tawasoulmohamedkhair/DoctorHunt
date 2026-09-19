import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/cubit/doctordetails_cubit.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCard extends StatelessWidget {
  final dynamic doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  doctor.imageUrl,
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _getName(context, doctor.nameKey),
                            style: context.medium18textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<DoctorDetailsCubit>().toggleFavorite();
                          },
                          child: Icon(
                            doctor.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: doctor.isFavorite ? AppColors.danger : AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getSpecialty(context, doctor.specialtyKey),
                      style:context.light13textSub
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        ...List.generate(5, (i) {
                          return Icon(
                            i < doctor.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: AppColors.rating,
                            size: 16,
                          );
                        }),
                        const Spacer(),
                        Text(
                          '\$${doctor.pricePerHour.toStringAsFixed(2)}/hr',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(
            onPressed: () {},
            label: Text(
              context.t.details.bookNow,
              style: context.medium14white
            ),
          ),
        ],
      ),
    );
  }
  String _getName(BuildContext context, String key) {
    switch (key) {
      case 'pediatrician':
        return context.t.details.drPediatrician;
      default:
        return key;
    }
  }

  String _getSpecialty(BuildContext context, String key) {
    switch (key) {
      case 'specialistCardiologist':
        return context.t.details.specialistsCardiologist;
      default:
        return key;
    }
  }
}
