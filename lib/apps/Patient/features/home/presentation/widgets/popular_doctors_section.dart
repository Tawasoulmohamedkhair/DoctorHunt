import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsSection extends StatelessWidget {
  final List<DoctorModel> doctors;
  final void Function(DoctorModel doctor)? onDoctorTap;
  final VoidCallback? onSeeAllTap;

  const PopularDoctorsSection({
    super.key,
    required this.doctors,
    this.onDoctorTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.home.popularDoctor, style: context.medium18textSecondary),
              Row(
                children: [
                  TextButton(
                    onPressed: onSeeAllTap,
                    child: Text(t.common.seeall, style: context.light12textSub),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return GestureDetector(
                onTap: () => onDoctorTap?.call(doctor),

                child: Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
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
                      Container(
                        width: 150.w,
                        height: 140.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,

                          image: DecorationImage(
                            image: AssetImage(doctor.imageUrl),
                            //  fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            getDoctorName(context, doctor.nameKey),
                            style: context.medium18textSecondary,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          getSpecialty(context, doctor.specialtyKey),
                          style: context.regular14textSub,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Icon(
                            i < doctor.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: AppColors.rating,
                            size: 16,
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

  String getDoctorName(BuildContext context, String key) {
    switch (key) {
      case 'ahmedHassan':
        return context.t.doctors.ahmedHassan;
      case 'mohamedAli':
        return context.t.doctors.mohamedAli;
      case 'khaledOmar':
        return context.t.doctors.khaledOmar;
      case 'fillerupGrab':
        return context.t.doctors.fillerupGrab;
      case 'youssefIbrahim':
        return context.t.doctors.youssefIbrahim;
      case 'crick':
        return context.t.doctors.crick;
      case 'strain':
        return context.t.doctors.strain;
      case 'lachinet':
        return context.t.doctors.lachinet;
      default:
        return key;
    }
  }

  String getSpecialty(BuildContext context, String key) {
    switch (key) {
      case 'cardiologist':
        return context.t.specialties.cardiologist;
      case 'surgeon':
        return context.t.specialties.surgeon;
      case 'dentist':
        return context.t.specialties.dentist;
      case 'medicineSpecialist':
        return context.t.specialties.medicineSpecialist;
      case 'dentistSpecialist':
        return context.t.specialties.dentistSpecialist;
      case 'general':
        return context.t.specialties.general;
      case 'neurologist':
        return context.t.specialties.neurologist;
      default:
        return key;
    }
  }
}
