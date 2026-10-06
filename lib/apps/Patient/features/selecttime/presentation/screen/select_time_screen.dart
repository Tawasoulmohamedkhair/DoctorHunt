import 'package:doctor_hunt/apps/core/widget/header_widget.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/data/model/doctor_details_data.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(16),
          vertical: context.h(12),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderAppBar(title: context.t.selecttime),
              SizedBox(height: context.h(12)),
              DoctorCard(doctor: DoctorDetailsData.sampleDoctor),
            ],
          ),
        ),
      ),
    );
  }
}
