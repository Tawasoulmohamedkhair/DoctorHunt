import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widget/header_appbar.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/cubit/appointment_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/widget/appointment_card.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/widget/appointment_message_view.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppointmentCubit>()..getMyAppointments(),
      child: const _AppointmentsView(),
    );
  }
}

class _AppointmentsView extends StatefulWidget {
  const _AppointmentsView();

  @override
  State<_AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<_AppointmentsView> {
  int _selectedTab = 0;

  String get _selectedStatus {
    switch (_selectedTab) {
      case 1:
        return 'completed';
      case 2:
        return 'cancelled';
      default:
        return 'upcoming';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                HeaderAppBar(
                  title: t.appointments,
                  onBackPressed: () {},
                  showBackButton: true,
                ),
                _buildTabs(),
                Expanded(
                  child: BlocBuilder<AppointmentCubit, AppointmentState>(
                    builder: (context, state) {
                      if (state is AppointmentLoading ||
                          state is AppointmentInitial) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }

                      if (state is AppointmentError) {
                        return MessageView(
                          message: state.message,
                          actionLabel: t.tryAgain,
                          onAction: () {
                            context
                                .read<AppointmentCubit>()
                                .getMyAppointments();
                          },
                        );
                      }

                      if (state is AppointmentLoaded) {
                        final appointments = state.appointments
                            .where(
                              (appointment) =>
                                  appointment.status == _selectedStatus,
                            )
                            .toList();

                        if (appointments.isEmpty) {
                          return MessageView(
                            message: _selectedTab == 0
                                ? t.noUpcomingAppointments
                                : _selectedTab == 1
                                ? t.noCompletedAppointments
                                : t.noCancelledAppointments,
                          );
                        }

                        return RefreshIndicator(
                          color: AppColors.primary,
                          onRefresh: () => context
                              .read<AppointmentCubit>()
                              .getMyAppointments(),
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                            itemCount: appointments.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                appointment: appointments[index],
                              );
                            },
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    final t = Translations.of(context);
    final tabs = [t.upcoming, t.completed, t.cancelled];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = _selectedTab == index;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index == tabs.length - 1 ? 0 : 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () => setState(() => _selectedTab = index),
                child: Container(
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.surfaceMint,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tabs[index],
                    style: context.regularPx12.copyWith(
                      fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                      color: selected ? Colors.white : AppColors.primary,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
