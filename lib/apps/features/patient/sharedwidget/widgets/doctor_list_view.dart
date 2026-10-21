import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/widget/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  final List<DoctorModel> doctors;
  final bool Function(DoctorModel doctor) isFavorite;
  final void Function(DoctorModel doctor)? onFavoriteTap;
  final void Function(DoctorModel doctor)? onDoctorTap;

  const DoctorListView({
    super.key,
    required this.doctors,
    required this.isFavorite,
    this.onFavoriteTap,
    this.onDoctorTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(context.w(16)),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];

        return Padding(
          padding: EdgeInsets.only(bottom: context.h(12)),
          child: DoctorCard(
            doctor: doctor,
            isFavorite: isFavorite(doctor),
            onFavoriteTap: onFavoriteTap == null
                ? null
                : () => onFavoriteTap!(doctor),
            onTap: onDoctorTap == null ? null : () => onDoctorTap!(doctor),
          ),
        );
      },
    );
  }
}
