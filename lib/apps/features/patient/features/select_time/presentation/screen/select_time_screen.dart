import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/booking_success_dialog.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/select_time_header.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/widgets/select_time_schedule.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key, required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return BlocProvider(
      create: (_) =>
          getIt<SelectTimeCubit>()
            ..loadMonth(doctorId, DateTime(now.year, now.month)),
      child: _SelectTimeView(doctorId: doctorId),
    );
  }
}

class _SelectTimeView extends StatefulWidget {
  const _SelectTimeView({required this.doctorId});

  final String doctorId;

  @override
  State<_SelectTimeView> createState() => _SelectTimeViewState();
}

class _SelectTimeViewState extends State<_SelectTimeView> {
  late final Future<DoctorModel> _doctorFuture;

  @override
  void initState() {
    super.initState();
    _doctorFuture = getIt<DoctorRepository>().getDoctorById(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return FutureBuilder<DoctorModel>(
      future: _doctorFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: Text(t.selecttime)),
            body: Center(child: Text(t.unableToLoadDoctorDetails)),
          );
        }

        return _SelectTimeContent(
          doctor: snapshot.data!,
          doctorId: widget.doctorId,
        );
      },
    );
  }
}

class _SelectTimeContent extends StatelessWidget {
  const _SelectTimeContent({required this.doctor, required this.doctorId});

  final DoctorModel doctor;
  final String doctorId;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocListener<SelectTimeCubit, SelectTimeState>(
      listenWhen: (previous, current) =>
          previous.bookingId != current.bookingId ||
          previous.bookingError != current.bookingError,
      listener: (context, state) {
        if (state.bookingError != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.bookingError!)));
        }

        if (state.bookingId != null &&
            state.selectedDate != null &&
            state.selectedSlot != null) {
          final date = state.selectedDate!;
          final slot = state.selectedSlot!;

          showDialog<void>(
            context: context,
            barrierDismissible: false,
            barrierColor: AppColors.black,
            builder: (dialogContext) {
              return BookingSuccessDialog(
                doctor: doctor,
                date: date,
                time: slot.label,
                fee: doctor.fee.toString(),

                onDone: () {
                  Navigator.of(dialogContext).pop();
                  context.go('/appointments');
                },
              );
            },
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.images.bg.path, fit: BoxFit.cover),
            ),
            SafeArea(
              child: Column(
                children: [
                  SelectTimeHeader(onBack: () => Navigator.of(context).pop()),
                  Expanded(
                    child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
                      builder: (context, state) {
                        final cubit = context.read<SelectTimeCubit>();

                        return SelectTimeSchedule(
                          state: state,
                          doctor: doctor,
                          onRetry: () =>
                              cubit.loadMonth(doctorId, state.displayedMonth),
                          onPreviousMonth: () {
                            final previous = DateTime(
                              state.displayedMonth.year,
                              state.displayedMonth.month - 1,
                            );
                            cubit.loadMonth(doctorId, previous);
                          },
                          onNextMonth: () {
                            final next = DateTime(
                              state.displayedMonth.year,
                              state.displayedMonth.month + 1,
                            );
                            cubit.loadMonth(doctorId, next);
                          },
                          onDateSelected: cubit.selectDate,
                          onTimeSelected: cubit.selectTime,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      context.w(16),
                      context.h(10),
                      context.w(16),
                      context.h(16),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: context.h(52),
                      child: BlocBuilder<SelectTimeCubit, SelectTimeState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed:
                                state.selectedSlot == null ||
                                    state.isLoading ||
                                    state.isBooking ||
                                    state.errorMessage != null
                                ? null
                                : () {
                                    context
                                        .read<SelectTimeCubit>()
                                        .confirmBooking(doctorId: doctorId);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              disabledBackgroundColor: AppColors.lightGreys,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.isBooking
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  )
                                : Text(t.confirm, style: context.semiBoldPx16),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
