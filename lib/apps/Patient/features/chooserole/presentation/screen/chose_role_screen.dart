import 'package:doctor_hunt/apps/Patient/core/di/injection.dart';
import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/cubit/role_selection_state.dart';
import 'package:doctor_hunt/apps/Patient/features/chooserole/presentation/widget/role_card.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
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
    final t = context.t;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: AuthBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(15),
                  vertical: context.h(12),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(
                          height: isLandscape ? context.h(8) : context.h(20),
                        ),

                        Image.asset(
                          Assets.images.logo.path,
                          width: isLandscape ? context.w(50) : context.w(70),
                          height: isLandscape ? context.w(50) : context.w(70),
                        ),
                        SizedBox(height: context.h(6)),

                        Text(t.appName, style: context.bold25textMain),
                        SizedBox(
                          height: isLandscape ? context.h(12) : context.h(24),
                        ),

                        Text(t.chooseRole, style: context.regular28black),
                        SizedBox(height: context.h(6)),

                        Text(
                          t.selectedRole,
                          textAlign: TextAlign.center,
                          style: context.regular14textPlaceholder,
                        ),
                        SizedBox(
                          height: isLandscape ? context.h(12) : context.h(24),
                        ),

                        BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                RoleCard(
                                  title: t.patient,
                                  description: t.findDoctorbook,
                                  icon: Icons.person_outline_rounded,
                                  isSelected:
                                      state.selectedRole == UserRole.patient,
                                  onTap: () => context
                                      .read<RoleSelectionCubit>()
                                      .selectRole(UserRole.patient),
                                ),
                                SizedBox(height: context.h(10)),
                                RoleCard(
                                  title: t.admin,
                                  description: t.manageDoctors,
                                  icon: Icons.grid_view_rounded,
                                  isSelected:
                                      state.selectedRole == UserRole.admin,
                                  onTap: () => context
                                      .read<RoleSelectionCubit>()
                                      .selectRole(UserRole.admin),
                                ),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: context.h(20)),

                        BlocBuilder<RoleSelectionCubit, RoleSelectionState>(
                          builder: (context, state) {
                            return CustomElevatedButton(
                              onPressed: () {
                                LoginRoute(
                                  role: state.selectedRole,
                                ).go(context);
                              },
                              label: Text(
                                t.kContinue,
                                style: context.semiBold16white,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: context.h(16)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
