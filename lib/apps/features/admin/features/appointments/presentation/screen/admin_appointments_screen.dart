import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/header_appbar.dart';
import 'package:doctor_hunt/apps/features/admin/features/appointments/presentation/cubit/admin_appointments_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/appointments/presentation/cubit/admin_appointments_state.dart';
import 'package:doctor_hunt/apps/features/admin/features/appointments/presentation/widget/admin_appointment_card.dart';
import 'package:doctor_hunt/apps/router/app_routers.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminAppointmentsScreen extends StatelessWidget {
  const AdminAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminAppointmentsCubit>()..getAdminAppointments(),
      child: const _AdminAppointmentsView(),
    );
  }
}

class _AdminAppointmentsView extends StatefulWidget {
  const _AdminAppointmentsView();

  @override
  State<_AdminAppointmentsView> createState() => _AdminAppointmentsViewState();
}

class _AdminAppointmentsViewState extends State<_AdminAppointmentsView> {
  List<String> _tabs(BuildContext context) => [
    t.upcoming,
    t.completed,
    t.cancelled,
  ];

  int _selectedTab = 0;

  Future<void> _confirmCancelAppointment(
    Map<String, dynamic> appointment,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.cancelAppointmentQuestionAdmin),
        content: Text(t.confirmCancelAppointmentAdmin),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(t.keepAppointment),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              t.cancelAppointment,
              style: context.regular.copyWith(color: AppColors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    await context.read<AdminAppointmentsCubit>().cancelAppointment(
      appointment['id'].toString(),
    );
  }

  Future<void> _confirmCompleteAppointment(
    Map<String, dynamic> appointment,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.completeAppointmentQuestion),
        content: Text(t.confirmAppointmentCompleted),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(t.goBack),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(t.markAsCompleted),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    await context.read<AdminAppointmentsCubit>().completeAppointment(
      appointment['id'].toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.w(20)),
              child: HeaderAppBar(
                title: t.appointments,
                showBackButton: false,
                showAction: false,
                actionIcon: Icons.notifications_none_outlined,
                onActionPressed: () {},
                text: 'A',
                icon2: Icons.person,
              ),
            ),
            SizedBox(height: context.h(16)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_tabs(context).length, (index) {
                  final isSelected = _selectedTab == index;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.w(4)),
                    child: ChoiceChip(
                      label: Text(_tabs(context)[index]),
                      selected: isSelected,
                      selectedColor: AppColors.cyan,
                      onSelected: (_) {
                        setState(() => _selectedTab = index);
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: context.h(12)),
            Expanded(
              child:
                  BlocBuilder<AdminAppointmentsCubit, AdminAppointmentsState>(
                    builder: (context, state) {
                      if (state is AdminAppointmentsInitial ||
                          state is AdminAppointmentsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.cyan,
                          ),
                        );
                      }

                      if (state is AdminAppointmentsError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(state.message),
                          ),
                        );
                      }

                      if (state is AdminAppointmentsLoaded) {
                        final filteredAppointments = _filterAppointments(
                          state.appointments,
                        );

                        if (filteredAppointments.isEmpty) {
                          return  Center(
                            child: Text(t.noAppointmentsFound),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.w(20),
                            vertical: context.h(8),
                          ),
                          itemCount: filteredAppointments.length,
                          itemBuilder: (context, index) {
                            final appointment = filteredAppointments[index];

                            return AdminAppointmentCard(
                              appointment: appointment,
                              onCancel: () =>
                                  _confirmCancelAppointment(appointment),
                              onComplete: () =>
                                  _confirmCompleteAppointment(appointment),
                              onViewDetails: () {
                                AdminAppointmentDetailsRoute(
                                  appointmentId: appointment['id'].toString(),
                                ).push(context);
                              },
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _filterAppointments(
    List<Map<String, dynamic>> appointments,
  ) {
    const statuses = ['upcoming', 'completed', 'cancelled'];

    final status = statuses[_selectedTab];

    return appointments
        .where((appointment) => appointment['status'] == status)
        .toList();
  }
}
