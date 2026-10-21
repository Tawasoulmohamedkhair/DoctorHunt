import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/custom_outlined_action_button.dart';
import 'package:doctor_hunt/apps/core/widget/logout_confirmation_dialog.dart';
import 'package:doctor_hunt/apps/features/common/auth/data/repository/auth_repo.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/cubit/settings_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/screens/profile_screen.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_menu_tile.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_notification_tile.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_profile_card.dart';
import 'package:doctor_hunt/apps/features/patient/features/settings/presentation/widgets/settings_section_title.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>()..loadProfile(),
      child: const _SettingScreenView(),
    );
  }
}

class _SettingScreenView extends StatefulWidget {
  const _SettingScreenView();

  @override
  State<_SettingScreenView> createState() => _SettingScreenViewState();
}

class _SettingScreenViewState extends State<_SettingScreenView> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  Future<void> _openProfile() async {
    await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(builder: (_) => const ProfileScreen()),
    );

    if (!mounted) return;

    await context.read<SettingsCubit>().loadProfile();
  }

  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LogoutConfirmationDialog(),
    );

    if (shouldLogout != true || !mounted) return;

    await context.read<SettingsCubit>().logOut();
  }

  Future<void> _changePassword() async {
    final t = Translations.of(context);
    final email = _authRepository.currentUserEmail;

    if (email == null || email.isEmpty) {
      _showMessage(t.noEmailAddress);
      return;
    }

    try {
      await _authRepository.forgotPassword(email: email);

      if (!mounted) return;

      _showMessage(t.passwordResetInstructionsSent);
    } catch (error) {
      debugPrint('Password reset error: $error');

      if (!mounted) return;

      _showMessage(t.unableToSendPasswordResetEmail);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showLanguageDialog() {
    final t = Translations.of(context);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(t.chooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(t.english),
                onTap: () {
                  LocaleSettings.setLocale(AppLocale.en);
                  Navigator.pop(dialogContext);
                },
              ),
              ListTile(
                title: Text(t.arabic),
                onTap: () {
                  LocaleSettings.setLocale(AppLocale.ar);
                  Navigator.pop(dialogContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocConsumer<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) =>
          previous.logoutStatus != current.logoutStatus,
      listener: (context, state) {
        if (state.logoutStatus == SettingsLogoutStatus.success) {
          context.go('/choose-role');
        } else if (state.logoutStatus == SettingsLogoutStatus.failure) {
          _showMessage(t.logoutFailed);
          context.read<SettingsCubit>().resetLogoutStatus();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        context.w(16),
                        context.h(12),
                        context.w(16),
                        context.h(16),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          t.settings,
                          style: context.mediumPx18.copyWith(
                            fontSize: context.sp(18),
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          context.w(20),
                          context.h(12),
                          context.w(20),
                          context.h(24),
                        ),
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: _openProfile,
                            child: SettingsProfileCard(state: state),
                          ),
                          SizedBox(height: context.h(20)),
                          SettingsSectionTitle(title: t.accountSettings),
                          SizedBox(height: context.h(8)),
                          SettingsMenuTile(
                            icon: Icons.lock_outline,
                            iconColor: AppColors.dangerMuted,
                            title: t.changepassword,
                            onTap: _changePassword,
                          ),
                          const SettingsNotificationTile(),
                          SettingsMenuTile(
                            icon: Icons.privacy_tip_outlined,
                            iconColor: AppColors.successGreen,
                            title: t.privacyPolicy,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const PrivacyPolicyScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: context.h(24)),
                          SettingsSectionTitle(title: t.moreOptions),
                          SizedBox(height: context.h(8)),
                          SettingsMenuTile(
                            icon: Icons.language,
                            iconColor: AppColors.rating,
                            title: t.languages,
                            subtitle: t.chooseLanguage,
                            onTap: _showLanguageDialog,
                          ),
                          SettingsMenuTile(
                            icon: Icons.info_outline,
                            iconColor: AppColors.successGreen,
                            title: t.buildversion,
                            subtitle: t.version,
                            showArrow: false,
                          ),
                          SizedBox(height: context.h(28)),
                          CustomOutlinedActionButton(
                            text: state.isLoggingOut ? t.loggingOut : t.logout,
                            height: 50,
                            fontSize: context.sp(14),
                            fontWeight: FontWeight.w600,
                            borderRadius: 12,
                            backgroundColor: AppColors.dangerSurface,
                            foregroundColor: AppColors.red,
                            borderColor: AppColors.shadow,
                            onPressed: state.isLoggingOut
                                ? null
                                : _confirmLogout,
                            icon: state.isLoggingOut
                                ? SizedBox(
                                    width: context.w(18),
                                    height: context.w(18),
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.red,
                                    ),
                                  )
                                : const Icon(
                                    Icons.logout,
                                    color: AppColors.red,
                                  ),
                          ),
                          SizedBox(height: context.h(16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
