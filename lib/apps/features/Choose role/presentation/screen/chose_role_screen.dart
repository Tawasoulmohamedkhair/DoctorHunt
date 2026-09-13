import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/features/Choose%20role/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/features/Choose%20role/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/apps/features/Choose%20role/presentation/widget/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoleSelectionCubit>(
      create: (_) => getIt<RoleSelectionCubit>(),
      child: const _ChooseRoleView(),
    );
  }
}

class _ChooseRoleView extends StatelessWidget {
  const _ChooseRoleView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Logo
              Image.asset('assets/images/logo.png', width: 70, height: 70),

              //const SizedBox(height: 11),
              Text(
                'Doctor Hunt',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 25.h,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 25),
              // Header
              const Text(
                'Choose your role',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'The selected role determines the experience and available features.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
              SizedBox(height: 32.h),
              // Role Cards
              BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      RoleCard(
                        title: 'Patient',
                        description:
                            'Find doctors, book appointments, and manage your medical records.',
                        icon: Icons.person_outline_rounded,
                        isSelected: state.selectedRole == UserRole.patient,
                        onTap: () => context
                            .read<RoleSelectionCubit>()
                            .selectRole(UserRole.patient),
                      ),
                      const SizedBox(height: 16),
                      RoleCard(
                        title: 'Admin',
                        description:
                            'Manage doctors, appointments, users, and the platform.',
                        icon: Icons.grid_view_rounded,
                        isSelected: state.selectedRole == UserRole.admin,
                        onTap: () => context
                            .read<RoleSelectionCubit>()
                            .selectRole(UserRole.admin),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    //  context.read<RoleSelectionCubit>().submitRole();
                    const SignUpRoute().go(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A96E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
