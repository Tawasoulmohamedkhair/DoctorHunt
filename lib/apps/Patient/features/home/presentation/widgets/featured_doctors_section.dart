import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
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
              Text(t.featureDoctor, style: context.medium18textSecondary),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(t.seeall, style: context.light12textSub),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.height < 500 ? 150 : context.h(170),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _doctors.length,
            itemBuilder: (context, index) {
              final doctor = _doctors[index];
              return Container(
                width: context.w(130),
                margin: EdgeInsets.only(right: context.w(12)),
                padding: EdgeInsets.all(context.w(10)),
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
                            SizedBox(width: context.w(2)),
                            Text(
                              doctor.rating.toStringAsFixed(1),
                              style: context.medium10textSecondary,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: context.h(10)),
                    CircleAvatar(
                      radius: context.r(32),
                      backgroundImage: AssetImage(doctor.imageUrl),
                    ),

                    Text(
                      getDoctorName(context, doctor.nameKey),
                      style: context.medium12textSecondary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: context.h(4)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: '\$', style: context.medium9primary),
                          TextSpan(
                            text: doctor.pricePerHour.toStringAsFixed(2),
                            style: context.medium9textSecondary,
                          ),
                          TextSpan(
                            text: '/${t.hours}',
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
        SizedBox(height: context.h(20)),
      ],
    );
  }

  String getDoctorName(BuildContext context, String key) {
    switch (key) {
      case 'ahmedHassan':
        return t.ahmedHassan;
      case 'mohamedAli':
        return t.mohamedAli;
      case 'khaledOmar':
        return t.khaledOmar;
      case 'fillerupGrab':
        return t.fillerupGrab;
      case 'youssefIbrahim':
        return t.youssefIbrahim;
      case 'crick':
        return t.crick;
      case 'strain':
        return t.strain;
      case 'lachinet':
        return t.lachinet;
      default:
        return key;
    }
  }
}
