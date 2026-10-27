import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class DoctorSpecialtyTabs extends StatelessWidget {
  final List<DoctorModel> doctors;
  final List<SpecialtyModel> specialties;
  final String? selectedSpecialtyId;
  final ValueChanged<String?> onSelected;

  const DoctorSpecialtyTabs({
    super.key,
    required this.doctors,
    required this.specialties,
    required this.selectedSpecialtyId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(40),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _SpecialtyTab(
              title: 'All',
              count: doctors.length,
              isSelected: selectedSpecialtyId == null,
              onTap: () => onSelected(null),
            ),
            SizedBox(width: context.w(8)),
            ...specialties.map((specialty) {
              final count = doctors
                  .where((doctor) => doctor.specialtyId == specialty.id)
                  .length;

              return Padding(
                padding: EdgeInsets.only(right: context.w(8)),
                child: _SpecialtyTab(
                  title: localizeSpecialty(context, specialty.name),
                  count: count,
                  isSelected: selectedSpecialtyId == specialty.id,
                  onTap: () => onSelected(specialty.id),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SpecialtyTab extends StatelessWidget {
  final String title;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _SpecialtyTab({
    required this.title,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(context.r(20)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: context.w(14)),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.success : Colors.white,
            borderRadius: BorderRadius.circular(context.r(20)),
            border: Border.all(
              color: isSelected
                  ? AppColors.success
                  : const Color(0xFFE5E7EB),
            ),
          ),
          child: Center(
            child: Text(
              '$title ($count)',
              style: context.regularPx11.copyWith(fontSize: context.sp(11), fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400, color: isSelected ? AppColors.white : const Color(0xFF64748B)),
            ),
          ),
        ),
      ),
    );
  }
}

