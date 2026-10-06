import 'package:doctor_hunt/apps/admin/features/settings/presentation/cubit/adminsetting_cubit.dart';
import 'package:doctor_hunt/apps/admin/features/settings/presentation/cubit/adminsetting_state.dart';
import 'package:doctor_hunt/apps/admin/features/settings/presentation/widget/admin_information.dart';
import 'package:doctor_hunt/apps/admin/features/settings/presentation/widget/admin_menu.dart';
import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/custom_elevated_button.dart';
import 'package:doctor_hunt/apps/core/widget/header_widget.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSettingScreen extends StatelessWidget {
  const AdminSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminSettingsCubit>()..loadAdminSettings(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF3FBF4),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HeaderAppBar(
                  title: t.settings,
                  showBackButton: false,
                  actionIcon: Icons.notifications_none_outlined,
                ),
                const SizedBox(height: 24),
                BlocBuilder<AdminSettingsCubit, AdminSettingsState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case AdminSettingsStatus.initial:
                      case AdminSettingsStatus.loading:
                        return const AdminInformationLoading();

                      case AdminSettingsStatus.success:
                        return AdminInformation(settings: state.admin!);

                      case AdminSettingsStatus.failure:
                        return AdminInformationError(
                          message: state.errorMessage,
                        );
                    }
                  },
                ),
                const SizedBox(height: 16),
                const AdminMenu(),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  backgroundcolor: AppColors.pink,
                  width: 322,
                  label: Text(
                    t.logout,
                    style: const TextStyle(color: AppColors.red),
                  ),
                  icon: const Icon(Icons.logout, color: AppColors.red),
                  onPressed: () {
                    // Handle logout action
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
