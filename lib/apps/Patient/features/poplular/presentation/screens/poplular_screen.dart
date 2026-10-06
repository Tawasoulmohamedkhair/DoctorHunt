import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_state.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/widgets/doctor_find_card.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/widget/header_widget.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                HeaderAppBar(
                  title: t.popularDoctor,
                  onBackPressed: () => Navigator.pop(context),
                ),
                 Expanded(
                  child: BlocBuilder<FindDoctorsCubit, FindDoctorsState>(
                    builder: (context, state) {
                      if (state is FindDoctorsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is FindDoctorsError) {
                        return Center(child: Text(state.message));
                      }
                      if (state is FindDoctorsLoaded) {
                        if (state.doctors.isEmpty) {
                          return Center(child: Text(t.nodoctorfound));
                        }
                        return ListView.builder(
                          padding: EdgeInsets.all(context.w(16)),
                          itemCount: state.doctors.length,
                          itemBuilder: (context, index) {
                            final doctor = state.doctors[index];
                            return DoctorFindCard(doctor: doctor);
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
               // DoctorFindCard(doctor: ,) 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
