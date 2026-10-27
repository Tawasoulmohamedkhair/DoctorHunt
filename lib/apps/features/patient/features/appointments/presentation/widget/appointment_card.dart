import 'package:doctor_hunt/apps/core/widget/custom_outlined_action_button.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/helper/specialty_localization.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/data/model/appointment_model.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/cubit/appointment_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/widget/appointment_doctor_header.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/widget/appointment_info.dart';
import 'package:doctor_hunt/apps/features/patient/features/appointments/presentation/widget/rate_doctor_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AppointmentCard extends StatelessWidget {
 const AppointmentCard({super.key, required this.appointment});

 final AppointmentModel appointment;
  static const _green = AppColors.primary;
  static const _lightGreen = AppColors.surfaceMint;
  static const _red = Color(0xFFF15B5D);

  @override
  Widget build(BuildContext context) {
   final t = Translations.of(context);
   final doctorName = appointment.doctorName;
    final specialtyName = localizeSpecialty(context, appointment.specialtyName);
    final imageUrl = appointment.imageUrl;
    final doctorId = appointment.doctorId;
    final serviceName = appointment.serviceName;
    final fee = appointment.fee;
    final status = appointment.status;

    final dateLabel = _formatDate(appointment.appointmentDate);
    final timeLabel = _formatTime(appointment.appointmentTime);
    final hasReview = appointment.hasReview;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 20)],
      ),
      child: Column(
        children: [
          AppointmentDoctorHeader(
            doctorName: doctorName,
            specialtyName: specialtyName,
            imageUrl: imageUrl,
            status: status,
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Color(0xFFEEF0F4)),
          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppointmentInfo(
                  icon: Icons.calendar_today_outlined,
                  label: t.appointmentDate,
                  value: dateLabel,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AppointmentInfo(
                  icon: Icons.access_time,
                  label: t.appointmentTime,
                  value: timeLabel,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppointmentInfo(
                  icon: Icons.medical_services_outlined,
                  label: t.medicalService,
                  value: serviceName?.isNotEmpty == true ? serviceName! : '—',
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: AppointmentInfo(
                  icon: Icons.payments_outlined,
                  label: t.consultationFee,
                  value: fee == null ? '—' : '\$$fee',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: CustomOutlinedActionButton(
                  text: t.viewDetails,
                  height: 36,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  borderRadius: 6,
                  backgroundColor: AppColors.white,
                  foregroundColor: _green,
                  borderColor: _green,
                  onPressed: () => _showDetails(
                    context,
                    doctorName: doctorName,
                    specialtyName: specialtyName,
                    date: dateLabel,
                    time: timeLabel,
                    fee: fee,
                    serviceName: serviceName,
                  ),
                ),
              ),

              if (status == 'completed') ...[
                const SizedBox(width: 8),
                Expanded(
                  child: CustomOutlinedActionButton(
                    text: hasReview ? t.rated : t.rateDoctor,
                    height: 36,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    borderRadius: 6,
                    backgroundColor: _lightGreen,
                    foregroundColor: _green,
                    borderColor: _green,
                    onPressed: hasReview
                        ? null
                        : () => _rateDoctor(context, doctorId: doctorId),
                  ),
                ),
              ],

              if (status == 'upcoming') ...[
                const SizedBox(width: 8),
                Expanded(
                  child: CustomOutlinedActionButton(
                    text: t.cancelAppointment,
                    height: 36,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    borderRadius: 6,
                    onPressed: () => _cancelAppointment(context),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _rateDoctor(
    BuildContext context, {
    required String? doctorId,
  }) async {
    final t = Translations.of(context);
    final reviewData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) => const RateDoctorDialog(),
    );

    if (reviewData == null || !context.mounted) return;

    if (doctorId == null || doctorId.isEmpty) {
      _showMessage(context, t.doctorInformationUnavailable);
      return;
    }

    final rating = reviewData['rating'];
    final comment = reviewData['comment'];

    if (rating is! int || comment is! String) {
      _showMessage(context, t.invalidReviewInformation);
      return;
    }

    final cubit = context.read<AppointmentCubit>();

    await cubit.rateAppointment(
appointmentId: appointment.id,
      doctorId: doctorId,     
      rating: rating,
      comment: comment,
    );

    if (!context.mounted) return;

    final state = cubit.state;

    _showMessage(
      context,
      state is AppointmentError
          ? state.message
          : t.reviewSubmittedSuccessfully,
    );
  }

  Future<void> _cancelAppointment(BuildContext context) async {
    final t = Translations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.cancelAppointmentQuestion),
        content: Text(t.confirmCancelAppointment),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(t.keepAppointment),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              t.cancelAppointment,
              style: context.regular.copyWith(color: _red),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final cubit = context.read<AppointmentCubit>();

    await cubit.cancelAppointment(appointment.id);

    if (!context.mounted) return;

    final state = cubit.state;

    _showMessage(
      context,
      state is AppointmentError
          ? state.message
          : t.appointmentCancelledSuccessfully,
    );
  }

  void _showDetails(
    BuildContext context, {
    required String doctorName,
    required String specialtyName,
    required String date,
    required String time,
    required dynamic fee,
    required String? serviceName,
  }) {
    final t = Translations.of(context);
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.appointmentDetails),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctorName),
            Text(specialtyName),
            const SizedBox(height: 12),
            Text('${t.date}: $date'),
            Text('${t.time}: $time'),
            Text('${t.fee}: ${fee == null ? '—' : '\$$fee'}'),
            if (serviceName?.isNotEmpty == true)
              Text('${t.medicalService}: $serviceName'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.close),
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  

  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '—';

    try {
      return DateFormat('dd MMM yyyy').format(DateTime.parse(value));
    } catch (_) {
      return value;
    }
  }

  String _formatTime(String? value) {
    if (value == null || value.isEmpty) return '—';

    try {
      final parts = value.split(':');
      final time = DateTime(
        2000,
        1,
        1,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      return DateFormat('HH:mm').format(time);
    } catch (_) {
      return value;
    }
  }
}
