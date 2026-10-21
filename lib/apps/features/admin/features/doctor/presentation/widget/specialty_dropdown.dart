
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/features/admin/core/model/specialty_model.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class SpecialtyDropdown extends StatelessWidget {
  const SpecialtyDropdown({
    super.key,
    required this.specialties,
    required this.selectedSpecialtyId,
    required this.onChanged,
  });

  final List<SpecialtyModel> specialties;
  final String? selectedSpecialtyId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(50),
      padding: EdgeInsets.symmetric(
        horizontal: context.w(14),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(12)),
        border: Border.all(
          color: AppColors.borderMuted,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: specialties.any(
            (specialty) => specialty.id == selectedSpecialtyId,
          )
              ? selectedSpecialtyId
              : null,
          isExpanded: true,
          hint: Text(
            t.selectSpecialty,
            style: context.regularPx15.copyWith(fontSize: context.sp(15), color: AppColors.textSub),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: context.r(22),
            color: AppColors.textMuted,
          ),
          items: specialties.map((specialty) {
            return DropdownMenuItem<String>(
              value: specialty.id,
              child: Text(
                localizeSpecialty(context, specialty.name),
                style: context.mediumPx15.copyWith(fontSize: context.sp(15), color: AppColors.textDeep),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

