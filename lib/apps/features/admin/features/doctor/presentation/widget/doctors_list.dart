import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/admin/features/doctor/presentation/widget/admin_doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  final List<DoctorModel> doctors;
  final ValueChanged<String> onDoctorTap;

  const DoctorsList({
    super.key,
    required this.doctors,
    required this.onDoctorTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      separatorBuilder: (_, _) {
        return SizedBox(height: context.h(12));
      },
      itemBuilder: (context, index) {
        final doctor = doctors[index];

        return AdminDoctorCard(
          doctor: doctor,
          onTap: () => onDoctorTap(doctor.id),
        );
      },
    );
  }
}
