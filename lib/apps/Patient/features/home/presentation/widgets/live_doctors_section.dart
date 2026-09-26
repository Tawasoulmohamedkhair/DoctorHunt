import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class LiveDoctorsSection extends StatelessWidget {
  final List<DoctorModel> doctors;

  const LiveDoctorsSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ...
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.w(20),
            context.h(16),
            context.w(20),
            context.h(12),
          ),
          child: Text(t.liveDoctor, style: context.medium18textSecondary),
        ),
        SizedBox(
          height: context.h(150),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.w(16)),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return Container(
                width: context.w(120),
                margin: EdgeInsets.only(right: context.w(12)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(context.r(16)),
                      child: Image.asset(
                        doctor.imageUrl,
                        height: context.h(150),
                        width: context.w(120),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // ...
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
