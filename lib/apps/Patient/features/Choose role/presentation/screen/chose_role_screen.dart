import 'package:doctor_hunt/apps/Patient/core/di/injection.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/Choose%20role/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/Choose%20role/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/apps/Patient/features/Choose%20role/presentation/widget/role_card.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final t = context.t.chooserole;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Logo
              Image.asset(Assets.images.logo.path, width: 70, height: 70),

              Expanded(
                child: Text(context.t.appName, style: context.bold25textMain),
              ),

              // Header
              Text(t.chooseRole, style: context.regular28black),
              Expanded(
                child: Text(
                  t.selectedRole,
                  textAlign: TextAlign.center,
                  style: context.regular14textPlaceholder,
                ),
              ),

              // Role Cards
              BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      RoleCard(
                        title: t.patient,
                        description: t.findDoctorbook,
                        icon: Icons.person_outline_rounded,
                        isSelected: state.selectedRole == UserRole.patient,
                        onTap: () => context
                            .read<RoleSelectionCubit>()
                            .selectRole(UserRole.patient),
                      ),
                      SizedBox(height: 10),
                      RoleCard(
                        title: t.admin,
                        description: t.manageDoctors,
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
              SizedBox(height: 10),

              // Continue Button
              CustomElevatedButton(
                onPressed: () {
                  const SignUpRoute().go(context);
                },
                label: Text(
                  context.t.common.kContinue,
                  style: context.semiBold16white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
