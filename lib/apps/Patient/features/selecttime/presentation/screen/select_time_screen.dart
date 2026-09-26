import 'package:doctor_hunt/apps/Patient/core/widget/header_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/data/model/doctor_details_data.dart';
import 'package:doctor_hunt/apps/Patient/features/doctordetails/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [HeaderAppBar(title: context.t.selecttime),
      DoctorCard(doctor: DoctorDetailsData,),
      ]),
    );
  }
}
