import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class FeaturedDoctorsSection extends StatefulWidget {
  final List<DoctorModel> doctors;

  const FeaturedDoctorsSection({super.key, required this.doctors});

  @override
  State<FeaturedDoctorsSection> createState() => _FeaturedDoctorsSectionState();
}

class _FeaturedDoctorsSectionState extends State<FeaturedDoctorsSection> {
  late List<DoctorModel> _doctors;

  @override
  void initState() {
    super.initState();
    _doctors = List.from(widget.doctors);
  }

  void _toggleFavorite(int index) {
    setState(() {
      _doctors[index] = _doctors[index].copyWith(
        isFavorite: !_doctors[index].isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.home.featureDoctor, style: context.medium18textSecondary),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(t.common.seeall, style: context.light12textSub),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _doctors.length,
            itemBuilder: (context, index) {
              final doctor = _doctors[index];
              return Container(
                width: 130,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _toggleFavorite(index),
                          child: Icon(
                            doctor.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 20,
                            color: doctor.isFavorite
                                ? AppColors.danger
                                : AppColors.grey,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 11,
                              color: AppColors.rating,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              doctor.rating.toStringAsFixed(1),
                              style: context.medium10textSecondary,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(doctor.imageUrl),
                    ),

                    Text(
                      getDoctorName(context, doctor.nameKey),
                      style: context.medium12textSecondary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: '\$', style: context.medium9primary),
                          TextSpan(
                            text: doctor.pricePerHour.toStringAsFixed(2),
                            style: context.medium9textSecondary,
                          ),
                          TextSpan(
                            text: '/${t.common.hours}',
                            style: context.medium9textSecondary,
                          ),
                        ],
                      ),
                    ),

                   
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
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
}
