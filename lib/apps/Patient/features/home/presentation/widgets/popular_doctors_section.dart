import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

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
              : context.h(250),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.w(16)),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return GestureDetector(
                onTap: () => onDoctorTap?.call(doctor),
                child: Container(
                  width: context.w(160),
                  margin: EdgeInsets.only(right: context.w(12)),
                  padding: EdgeInsets.all(context.w(12)),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: context.w(150),
                        height: context.h(130),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(context.r(12)),
                          image: DecorationImage(
                            image: AssetImage(doctor.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: context.h(10)),
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            getDoctorName(context, doctor.nameKey),
                            style: context.medium18textSecondary,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: context.h(4)),
                      Text(
                        getSpecialty(context, doctor.specialtyKey),
                        style: context.regular14textSub,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: context.h(6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Icon(
                            i < doctor.rating.floor()
                                ? Icons.star
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

  String getDoctorName(BuildContext context, String key) {
    switch (key) {
      case 'ahmedHassan':
        return context.t.ahmedHassan;
      case 'mohamedAli':
        return context.t.mohamedAli;
      case 'khaledOmar':
        return context.t.khaledOmar;
      case 'fillerupGrab':
        return context.t.fillerupGrab;
      case 'youssefIbrahim':
        return context.t.youssefIbrahim;
      case 'crick':
        return context.t.crick;
      case 'strain':
        return context.t.strain;
      case 'lachinet':
        return context.t.lachinet;
      default:
        return key;
    }
  }

  String getSpecialty(BuildContext context, String key) {
    switch (key) {
      case 'cardiologist':
        return context.t.cardiologist;
      case 'surgeon':
        return context.t.surgeon;
      case 'dentist':
        return context.t.dentist;
      case 'medicineSpecialist':
        return context.t.medicineSpecialist;
      case 'dentistSpecialist':
        return t.dentistSpecialist;
      case 'general':
        return t.general;
      case 'neurologist':
        return t.neurologist;
      default:
        return key;
    }
  }
}
