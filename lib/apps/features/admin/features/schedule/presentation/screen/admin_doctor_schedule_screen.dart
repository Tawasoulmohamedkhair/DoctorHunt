import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/admin/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:doctor_hunt/apps/features/admin/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';

class AdminDoctorScheduleScreen extends StatefulWidget {
  const AdminDoctorScheduleScreen({super.key, required this.doctorId});

  final String doctorId;

  @override
  State<AdminDoctorScheduleScreen> createState() =>
      _AdminDoctorScheduleScreenState();
}

class _AdminDoctorScheduleScreenState extends State<AdminDoctorScheduleScreen> {
  late DateTime _selectedMonth;
  late DateTime _selectedDate;

  final List<Map<String, dynamic>> _draftRows = [];

  bool _draftInitialized = false;
  bool _hasUnsavedChanges = false;

  bool get _isBusy {
    final status = context.read<ScheduleCubit>().state.status;

    return status == ScheduleStatus.saving ||
        status == ScheduleStatus.publishing ||
        status == ScheduleStatus.loading;
  }

  @override
  void initState() {
    super.initState();
    _selectCurrentDate();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _loadMonth(_selectedMonth);
    });
  }

  void _selectCurrentDate() {
    final now = DateTime.now();

    _selectedMonth = DateTime(now.year, now.month, 1);
    _selectedDate = DateTime(now.year, now.month, now.day);
  }

  void _loadMonth(DateTime month) {
    context.read<ScheduleCubit>().loadMonth(
      doctorId: widget.doctorId,
      month: month,
    );
  }

  Future<void> _changeMonth(int offset) async {
    if (_isBusy) return;

    if (_hasUnsavedChanges) {
      final shouldDiscard = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AlertDialog(
          title: Text(t.unsavedChanges),
          content: Text(t.unsavedSchedulePrompt),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(t.stay),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(t.discard),
            ),
          ],
        ),
      );

      if (!mounted || shouldDiscard != true) return;
    }

    final month = DateTime(
      _selectedMonth.year,
      _selectedMonth.month + offset,
      1,
    );

    setState(() {
      _selectedMonth = month;
      _selectedDate = month;
      _draftRows.clear();
      _draftInitialized = false;
      _hasUnsavedChanges = false;
    });

    _loadMonth(month);
  }

  String _monthLabel(DateTime date) {
    final months = [
      t.january,
      t.february,
      t.march,
      t.april,
      t.may,
      t.june,
      t.july,
      t.august,
      t.september,
      t.october,
      t.november,
      t.december,
    ];

    return '${months[date.month - 1]} ${date.year}';
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  String _formatTime(dynamic value) {
    if (value == null) return '';

    final parts = value.toString().split(':');

    if (parts.length < 2) return value.toString();

    return '${parts[0].padLeft(2, '0')}:'
        '${parts[1].padLeft(2, '0')}';
  }

  int? _parseDayOfWeek(dynamic value) {
    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '');
  }

  bool _isOpen(dynamic value) {
    return value == true || value.toString().toLowerCase() == 'true';
  }

  void _syncDraft(ScheduleState state) {
    if (_draftInitialized) return;
    _replaceDraftRows(state.availability);
  }

  void _replaceDraftRows(List<Map<String, dynamic>> rows) {
    _draftRows
      ..clear()
      ..addAll(rows.map((row) => Map<String, dynamic>.from(row)));

    _draftInitialized = true;
    _hasUnsavedChanges = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3FBF4),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          t.manageAvailability,
          style: context.boldPx20.copyWith(fontSize: context.sp(20), color: AppColors.textDeep),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<ScheduleCubit, ScheduleState>(
          listener: (context, state) {
            if (state.status == ScheduleStatus.loaded) {
              _syncDraft(state);
            }

            if (state.status == ScheduleStatus.success) {
              setState(() {
                _replaceDraftRows(state.availability);
              });

              _showMessage(t.scheduleOperationCompleted);
            }

            if (state.status == ScheduleStatus.failure &&
                state.errorMessage != null) {
              _showMessage(state.errorMessage!);
            }
          },
          builder: (context, state) {
            if (state.status == ScheduleStatus.initial ||
                state.status == ScheduleStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.success),
              );
            }

            if (state.status == ScheduleStatus.failure &&
                state.services.isEmpty) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.errorMessage ?? t.unableToLoadSchedule,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => _loadMonth(_selectedMonth),
                        child: Text(t.retry),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: [
                _buildMonthSelector(),
                Expanded(child: _buildScheduleContent(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(16),
        vertical: context.h(8),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(8),
          vertical: context.h(4),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: _isBusy ? null : () => _changeMonth(-1),
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Text(
                _monthLabel(_selectedMonth),
                textAlign: TextAlign.center,
                style: context.semiBoldPx16.copyWith(fontSize: context.sp(16)),
              ),
            ),
            IconButton(
              onPressed: _isBusy ? null : () => _changeMonth(1),
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleContent(ScheduleState state) {
    final isPublished = state.isPublished;
    final sourceRows = isPublished ? state.availability : _draftRows;

    return ListView(
      padding: EdgeInsets.fromLTRB(
        context.w(16),
        context.h(4),
        context.w(16),
        context.h(20),
      ),
      children: [
        _buildInfoBanner(isPublished),
        SizedBox(height: context.h(12)),
        _buildCalendar(state, sourceRows),
        SizedBox(height: context.h(16)),
        Text(
          '${_weekdayName(_selectedDate.weekday)}, '
          '${_selectedDate.day} ${_monthLabel(_selectedDate)}',
          style: context.boldPx16.copyWith(fontSize: context.sp(16), color: AppColors.textDeep),
        ),
        SizedBox(height: context.h(10)),
        _buildDayCard(
          date: _selectedDate,
          state: state,
          sourceRows: sourceRows,
          isPublished: isPublished,
        ),
        SizedBox(height: context.h(16)),
        if (!isPublished)
          _buildDraftActions(state)
        else
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              t.publishedScheduleCannotSaveDraft,
              textAlign: TextAlign.center,
              style: context.regular.copyWith(color: Colors.black54),
            ),
          ),
      ],
    );
  }

  Widget _buildCalendar(
    ScheduleState state,
    List<Map<String, dynamic>> sourceRows,
  ) {
    return Container(
      padding: EdgeInsets.all(context.w(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceGreenAlt),
      ),
      child: Column(
        children: [
          TableCalendar<void>(
            firstDay: DateTime(2000, 1, 1),
            lastDay: DateTime(2100, 12, 31),
            focusedDay: _selectedMonth,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            daysOfWeekVisible: true,
            availableGestures: AvailableGestures.none,
            rowHeight: context.h(54),
            daysOfWeekHeight: context.h(32),
            selectedDayPredicate: (day) {
              return day.year == _selectedDate.year &&
                  day.month == _selectedDate.month &&
                  day.day == _selectedDate.day;
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (_isBusy) return;

              setState(() {
                _selectedDate = DateTime(
                  selectedDay.year,
                  selectedDay.month,
                  selectedDay.day,
                );
              });
            },
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              cellMargin: EdgeInsets.all(2),
              cellPadding: EdgeInsets.zero,
            ),

            daysOfWeekStyle:  DaysOfWeekStyle(
              weekdayStyle: context.semiBoldPx11.copyWith(color: Colors.black54),
              weekendStyle: context.semiBoldPx11.copyWith(color: Colors.black54),
            ),
            calendarBuilders: CalendarBuilders<void>(
              defaultBuilder: (context, day, focusedDay) {
                return _buildCalendarDay(
                  date: day,
                  state: state,
                  sourceRows: sourceRows,
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return _buildCalendarDay(
                  date: day,
                  state: state,
                  sourceRows: sourceRows,
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return _buildCalendarDay(
                  date: day,
                  state: state,
                  sourceRows: sourceRows,
                );
              },
              dowBuilder: (context, day) {
                final weekdays = [
                  t.mondayShort,
                  t.tuesdayShort,
                  t.wednesdayShort,
                  t.thursdayShort,
                  t.fridayShort,
                  t.saturdayShort,
                  t.sundayShort,
                ];

                return Center(
                  child: Text(
                    weekdays[day.weekday - 1],
                    style: context.semiBoldPx11.copyWith(color: Colors.black54),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: [
              _CalendarLegend(color: AppColors.success, label: t.workingDay),
              _CalendarLegend(color: AppColors.surfaceRed, label: t.clinicClosed),
              _CalendarLegend(color: AppColors.surfaceGreenAlt, label: t.available),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDay({
    required DateTime date,
    required ScheduleState state,
    required List<Map<String, dynamic>> sourceRows,
  }) {
    final dateKey = _formatDate(date);

    final hasWorkingDay = sourceRows.any(
      (row) => row['work_date']?.toString().startsWith(dateKey) ?? false,
    );

    final dayOfWeek = date.weekday % 7;

    final isOpen = state.operatingHours.any((row) {
      return _parseDayOfWeek(row['day_of_week']) == dayOfWeek &&
          _isOpen(row['is_open']);
    });

    final isSelected =
        date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;

    final isFriday = date.weekday == DateTime.friday;
    final isClosed = !isOpen;

    final backgroundColor = isSelected
        ? AppColors.success
        : hasWorkingDay
        ? const Color(0xFFE1F8ED)
        : isClosed
        ? AppColors.surfaceRed
        : const Color(0xFFF3F8F5);

    final foregroundColor = isSelected
        ? Colors.white
        : isFriday
        ? Colors.red.shade700
        : const Color(0xFF26352D);

    return Container(
      margin: const EdgeInsets.all(3),

      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? AppColors.successDark : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${date.day}',
              style: context.regularPx11.copyWith(fontSize: context.sp(11), fontWeight: isSelected || hasWorkingDay
                    ? FontWeight.w700
                    : FontWeight.w500, color: foregroundColor, height: 1),
            ),
            const SizedBox(height: 2),
            if (hasWorkingDay)
              Icon(
                Icons.check_circle,
                size: 8,
                color: isSelected ? Colors.white : AppColors.successDark,
              )
            else if (isClosed)
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.red.shade300,
                  shape: BoxShape.circle,
                ),
              )
            else
              const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner(bool isPublished) {
    return Container(
      padding: EdgeInsets.all(context.w(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: AppColors.success, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              isPublished
                  ? t.publishedScheduleProtected
                  : t.addWorkingDaysDraft,
              style: context.regularPx12.copyWith(fontSize: context.sp(12), color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCard({
    required DateTime date,
    required ScheduleState state,
    required List<Map<String, dynamic>> sourceRows,
    required bool isPublished,
  }) {
    final dateKey = _formatDate(date);

    final dayRows = sourceRows.where((row) {
      return row['work_date']?.toString().startsWith(dateKey) ?? false;
    }).toList();

    final dayOfWeek = date.weekday % 7;

    final operatingHours = state.operatingHours.where((row) {
      return _parseDayOfWeek(row['day_of_week']) == dayOfWeek &&
          _isOpen(row['is_open']);
    }).toList();

    final isFriday = date.weekday == DateTime.friday;
    final isClosed = operatingHours.isEmpty;
    return Container(
      padding: EdgeInsets.all(context.w(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceGreenAlt),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: context.w(38),
                height: context.w(38),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isFriday
                      ? AppColors.surfaceRed
                      : const Color(0xFFE5F8EF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${date.day}',
                  style: context.bold.copyWith(color: isFriday ? Colors.red : AppColors.successDark),
                ),
              ),
              SizedBox(width: context.w(12)),
              Expanded(
                child: Text(
                  '${_weekdayName(date.weekday)}'
                  '${isClosed ? ' • ${t.closed}' : ''}',
                  style: context.semiBoldPx14.copyWith(fontSize: context.sp(14)),
                ),
              ),
              if (dayRows.isNotEmpty)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 20,
                ),
            ],
          ),
          for (final row in dayRows)
            Padding(
              padding: EdgeInsets.only(top: context.h(8)),
              child: Row(
                children: [
                  Expanded(child: _buildAvailabilityRow(row, state.services)),
                  if (isPublished)
                    IconButton(
                      tooltip: t.editPublishedAvailability,
                      onPressed: _isBusy
                          ? null
                          : () => _editPublishedAvailability(
                              date: date,
                              row: row,
                              state: state,
                            ),
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: AppColors.successDark,
                      ),
                    )
                  else
                    IconButton(
                      tooltip: t.removeFromDraft,
                      onPressed: _isBusy ? null : () => _removeDraftDay(row),
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                    ),
                ],
              ),
            ),
          if (dayRows.isEmpty && !isClosed)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: _isBusy ? null : () => _addWorkingDay(date, state),
                icon: const Icon(Icons.add),
                label: Text(t.addWorkingDay),
              ),
            ),
          if (dayRows.isEmpty && isClosed)
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                t.clinicClosed,
                style: context.regularPx12.copyWith(color: Colors.black54),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDraftActions(ScheduleState state) {
    final isSaving = state.status == ScheduleStatus.saving;
    final isPublishing = state.status == ScheduleStatus.publishing;

    final busy =
        isSaving || isPublishing || state.status == ScheduleStatus.loading;

    final canPublish =
        state.isDraft &&
        state.availability.isNotEmpty &&
        !_hasUnsavedChanges &&
        !busy;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: busy ? null : () => _saveDraft(state),
                child: isSaving
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(t.saveDraft),
              ),
            ),
            SizedBox(width: context.w(12)),
            Expanded(
              child: ElevatedButton(
                onPressed: canPublish
                    ? () {
                        context.read<ScheduleCubit>().publishSchedule(
                          doctorId: widget.doctorId,
                          month: _selectedMonth,
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                ),
                child: isPublishing
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(t.publish),
              ),
            ),
          ],
        ),
        if (_hasUnsavedChanges) ...[
          SizedBox(height: context.h(8)),
          Text(
            t.saveChangesBeforePublishing,
            textAlign: TextAlign.center,
            style: context.regularPx12.copyWith(color: Colors.black54),
          ),
        ],
      ],
    );
  }

  Future<void> _addWorkingDay(DateTime date, ScheduleState state) async {
    if (_isBusy) return;

    final isPublished = state.isPublished;
    final dateKey = _formatDate(date);

    // Use database records for published schedules,
    // and local draft records for unpublished schedules.
    final sourceRows = isPublished ? state.availability : _draftRows;

    if (sourceRows.any(
      (row) => row['work_date']?.toString().startsWith(dateKey) ?? false,
    )) {
      _showMessage(t.aShiftAlreadyExistsForDate);
      return;
    }

    final dayOfWeek = date.weekday % 7;

    final availableShifts = state.operatingHours.where((row) {
      return _parseDayOfWeek(row['day_of_week']) == dayOfWeek &&
          _isOpen(row['is_open']);
    }).toList();

    if (availableShifts.isEmpty) {
      _showMessage(t.noClinicHoursForDay);
      return;
    }

    if (state.services.isEmpty) {
      _showMessage(t.noActiveServicesAssigned);
      return;
    }

    final firstServiceId = state.services.first['medical_service_id']
        ?.toString();

    if (firstServiceId == null || firstServiceId.isEmpty) {
      _showMessage(t.noValidMedicalService);
      return;
    }

    var selectedServiceId = firstServiceId;
    var selectedShift = availableShifts.first['shift'].toString();

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: Text(
                t.addScheduleDay
                    .replaceAll('{weekday}', _weekdayName(date.weekday))
                    .replaceAll('{day}', date.day.toString()),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: selectedServiceId,
                      isExpanded: true,
                      decoration: InputDecoration(labelText: t.medicalService),
                      items: state.services.map((service) {
                        final serviceData = service['medical_services'];

                        final serviceName = serviceData is Map
                            ? serviceData['name']?.toString() ??
                                  t.medicalService
                            : t.medicalService;

                        return DropdownMenuItem<String>(
                          value: service['medical_service_id'].toString(),
                          child: Text(
                            serviceName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        setDialogState(() {
                          selectedServiceId = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: selectedShift,
                      isExpanded: true,
                      decoration: InputDecoration(labelText: t.shift),
                      items: availableShifts.map((row) {
                        final shift = row['shift'].toString();

                        return DropdownMenuItem<String>(
                          value: shift,
                          child: Text(
                            '${_shiftLabel(shift)} '
                            '(${_formatTime(row['start_time'])}–'
                            '${_formatTime(row['end_time'])})',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        setDialogState(() {
                          selectedShift = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      t.defaultClinicHoursForShift,
                      style: context.regularPx12,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(t.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    final hours = availableShifts.firstWhere(
                      (row) => row['shift'].toString() == selectedShift,
                    );

                    Navigator.pop(dialogContext, {
                      'medical_service_id': selectedServiceId,
                      'shift': selectedShift,
                      'start_time': _formatTime(hours['start_time']),
                      'end_time': _formatTime(hours['end_time']),
                      'slot_duration_minutes': 30,
                    });
                  },
                  child: Text(t.add),
                ),
              ],
            );
          },
        );
      },
    );

    if (!mounted || result == null) return;

    // Check again in case the data changed while the dialog was open.
    final currentState = context.read<ScheduleCubit>().state;
    final currentRows = currentState.isPublished
        ? currentState.availability
        : _draftRows;

    if (currentRows.any(
      (row) => row['work_date']?.toString().startsWith(dateKey) ?? false,
    )) {
      _showMessage(t.aShiftAlreadyExistsForDate);
      return;
    }

    if (currentState.isPublished) {
      // Persist directly to Supabase; do not add locally as a draft.
      await context.read<ScheduleCubit>().addPublishedAvailability(
        doctorId: widget.doctorId,
        medicalServiceId: result['medical_service_id'] as String,
        workDate: DateTime(date.year, date.month, date.day),
        shift: result['shift'] as String,
        startTime: result['start_time'] as String,
        endTime: result['end_time'] as String,
        slotDurationMinutes:
            (result['slot_duration_minutes'] as num?)?.toInt() ?? 30,
      );

      return;
    }

    // Keep the existing draft workflow unchanged.
    setState(() {
      _draftRows.add({...result, 'work_date': dateKey});

      _draftRows.sort(
        (a, b) =>
            a['work_date'].toString().compareTo(b['work_date'].toString()),
      );

      _hasUnsavedChanges = true;
    });

    _showMessage(t.workingDayAddedSaveDraft);
  }

  void _removeDraftDay(Map<String, dynamic> row) {
    if (_isBusy) return;

    if (_draftRows.length <= 1) {
      _showMessage(
        'At least one working day is required. '
        'You cannot remove the last day.',
      );
      return;
    }

    setState(() {
      _draftRows.remove(row);
      _hasUnsavedChanges = true;
    });
  }

  Future<void> _saveDraft(ScheduleState state) async {
    if (state.isPublished) {
      _showMessage(t.cannotSavePublishedScheduleAsDraft);
      return;
    }

    if (_draftRows.isEmpty) {
      _showMessage(t.addWorkingDayBeforeSaving);
      return;
    }

    await context.read<ScheduleCubit>().saveDraft(
      doctorId: widget.doctorId,
      month: _selectedMonth,
      availabilityRows: _draftRows
          .map((row) => Map<String, dynamic>.from(row))
          .toList(),
    );
  }

  // Edit an existing availability in a published schedule.
  Future<void> _editPublishedAvailability({
    required DateTime date,
    required Map<String, dynamic> row,
    required ScheduleState state,
  }) async {
    if (!state.isPublished || _isBusy) return;

    final availabilityId = row['id']?.toString();

    if (availabilityId == null || availabilityId.isEmpty) {
      _showMessage(t.availabilityIdMissing);
      return;
    }

    if (state.services.isEmpty) {
      _showMessage(t.noActiveMedicalServicesAvailable);
      return;
    }

    final dayOfWeek = date.weekday % 7;

    final availableShifts = state.operatingHours.where((item) {
      return _parseDayOfWeek(item['day_of_week']) == dayOfWeek &&
          _isOpen(item['is_open']);
    }).toList();

    if (availableShifts.isEmpty) {
      _showMessage(t.noClinicHoursForDay);
      return;
    }

    final serviceIds = state.services
        .map((item) => item['medical_service_id'].toString())
        .toSet();

    var selectedServiceId = row['medical_service_id']?.toString() ?? '';

    if (!serviceIds.contains(selectedServiceId)) {
      selectedServiceId = state.services.first['medical_service_id'].toString();
    }

    var selectedShift = row['shift']?.toString() ?? '';

    if (!availableShifts.any(
      (item) => item['shift'].toString() == selectedShift,
    )) {
      selectedShift = availableShifts.first['shift'].toString();
    }

    final startController = TextEditingController(
      text: _formatTime(row['start_time']),
    );

    final endController = TextEditingController(
      text: _formatTime(row['end_time']),
    );

    try {
      final result = await showDialog<Map<String, dynamic>>(
        context: context,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogContext, setDialogState) {
              final shiftHours = availableShifts.firstWhere(
                (item) => item['shift'].toString() == selectedShift,
              );

              return AlertDialog(
                title: Text(
                  t.editScheduleDay
                      .replaceAll('{weekday}', _weekdayName(date.weekday))
                      .replaceAll('{day}', date.day.toString()),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        initialValue: selectedServiceId,
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: t.medicalService,
                        ),
                        items: state.services.map((service) {
                          final data = service['medical_services'];

                          final name = data is Map
                              ? data['name']?.toString() ?? t.medicalService
                              : t.medicalService;

                          return DropdownMenuItem<String>(
                            value: service['medical_service_id'].toString(),
                            child: Text(name, overflow: TextOverflow.ellipsis),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) return;

                          setDialogState(() {
                            selectedServiceId = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        initialValue: selectedShift,
                        isExpanded: true,
                        decoration: InputDecoration(labelText: t.shift),
                        items: availableShifts.map((item) {
                          final shift = item['shift'].toString();

                          return DropdownMenuItem<String>(
                            value: shift,
                            child: Text(_shiftLabel(shift)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) return;

                          setDialogState(() {
                            selectedShift = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${t.clinicHours}: '
                        '${_formatTime(shiftHours['start_time'])} – '
                        '${_formatTime(shiftHours['end_time'])}',
                        style: context.regularPx12.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: startController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: t.startTime,
                          hintText: '07:00',
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: endController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: t.endTime,
                          hintText: '13:00',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.timeFormatHelp,
                        style: context.regularPx11.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String? normalizeTime(String value) {
                        final match = RegExp(
                          r'^(\d{1,2}):([0-5]\d)$',
                        ).firstMatch(value.trim());

                        if (match == null) return null;

                        final hour = int.tryParse(match.group(1)!);

                        if (hour == null || hour > 23) {
                          return null;
                        }

                        return '${hour.toString().padLeft(2, '0')}:'
                            '${match.group(2)}';
                      }

                      final start = normalizeTime(startController.text);
                      final end = normalizeTime(endController.text);

                      if (start == null ||
                          end == null ||
                          start.compareTo(end) >= 0) {
                        _showMessage(t.invalidTimeRange);
                        return;
                      }

                      final hours = availableShifts.firstWhere(
                        (item) => item['shift'].toString() == selectedShift,
                      );

                      final clinicStart = _formatTime(hours['start_time']);

                      final clinicEnd = _formatTime(hours['end_time']);

                      if (start.compareTo(clinicStart) < 0 ||
                          end.compareTo(clinicEnd) > 0) {
                        _showMessage(t.timesOutsideClinicHours);
                        return;
                      }

                      Navigator.pop(dialogContext, {
                        'medical_service_id': selectedServiceId,
                        'shift': selectedShift,
                        'start_time': start,
                        'end_time': end,
                      });
                    },
                    child: Text(t.savechange),
                  ),
                ],
              );
            },
          );
        },
      );

      if (!mounted || result == null) return;

      await context.read<ScheduleCubit>().updatePublishedAvailability(
        doctorId: widget.doctorId,
        availabilityId: availabilityId,
        medicalServiceId: result['medical_service_id'] as String,
        workDate: DateTime(date.year, date.month, date.day),
        shift: result['shift'] as String,
        startTime: result['start_time'] as String,
        endTime: result['end_time'] as String,
        slotDurationMinutes:
            (row['slot_duration_minutes'] as num?)?.toInt() ?? 30,
      );
    } catch (error) {
      
      if (mounted) {
        _showMessage(t.unableToEditAvailability);
      }
    } finally {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        startController.dispose();
        endController.dispose();
      });
    }
  }

  Widget _buildAvailabilityRow(
    Map<String, dynamic> row,
    List<Map<String, dynamic>> services,
  ) {
    final shift = row['shift']?.toString() ?? '';
    final startTime = _formatTime(row['start_time']);
    final endTime = _formatTime(row['end_time']);
    final serviceId = row['medical_service_id']?.toString() ?? '';

    final matchingServices = services.where(
      (item) => item['medical_service_id']?.toString() == serviceId,
    );

    final serviceData = matchingServices.isEmpty
        ? null
        : matchingServices.first['medical_services'];

    final serviceName = serviceData is Map
        ? serviceData['name']?.toString() ?? 'Medical service'
        : 'Medical service';

    return Container(
      padding: EdgeInsets.all(context.w(10)),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FBF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            shift == 'morning' ? Icons.wb_sunny_outlined : Icons.nights_stay,
            color: AppColors.successDark,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _shiftLabel(shift),
                  style: context.semiBold,
                ),
                Text(
                  '$startTime – $endTime',
                  style: context.regularPx12.copyWith(color: Colors.black54),
                ),
                Text(serviceName, style: context.regularPx12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _shiftLabel(String shift) {
    switch (shift) {
      case 'morning':
        return t.morning;
      case 'evening':
        return t.evening;
      default:
        return shift;
    }
  }

  String _weekdayName(int weekday) {
    final days = [
      t.monday,
      t.tuesday,
      t.wednesday,
      t.thursday,
      t.friday,
      t.saturday,
      t.sunday,
    ];

    return days[weekday - 1];
  }

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _CalendarLegend extends StatelessWidget {
  const _CalendarLegend({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: context.regularPx10.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}

