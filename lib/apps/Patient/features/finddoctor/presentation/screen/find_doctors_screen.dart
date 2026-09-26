import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/header_widget.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/cubit/finddoctor_state.dart';
import 'package:doctor_hunt/apps/Patient/features/finddoctor/presentation/widgets/doctor_find_card.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindDoctorsScreen extends StatefulWidget {
  final String? initialQuery;

  const FindDoctorsScreen({super.key, this.initialQuery});

  @override
  State<FindDoctorsScreen> createState() => _FindDoctorsScreenState();
}

class _FindDoctorsScreenState extends State<FindDoctorsScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightgray,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: context.h(20)),
              HeaderAppBar(title:t.find_doctors),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(16),
                  vertical: context.h(8),
                ),
                child: TextField(
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    context.read<FindDoctorsCubit>().search(value.trim());
                  },
                  decoration: InputDecoration(
                    hintText: t.search_hint,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _controller.clear();
                        context.read<FindDoctorsCubit>().search('');
                      },
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(context.r(30)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
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
                        return const Center(child: Text('No doctors found'));
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
            ],
          ),
        ],
      ),
    );
  }
}
