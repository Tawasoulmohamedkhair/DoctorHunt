
import 'package:equatable/equatable.dart';

enum ScheduleStatus {
  initial,
  loading,
  loaded,
  saving,
  publishing,
  success,
  failure,
}

class ScheduleState extends Equatable {
  const ScheduleState({
    this.status = ScheduleStatus.initial,
    this.selectedMonth,
    this.schedule,
    this.availability = const [],
    this.services = const [],
    this.errorMessage,
    this.operatingHours = const [],
  });

  final ScheduleStatus status;
  final DateTime? selectedMonth;
  final Map<String, dynamic>? schedule;
  final List<Map<String, dynamic>> availability;
  final List<Map<String, dynamic>> services;
  final String? errorMessage;

  bool get isPublished => schedule?['status'] == 'published';

  bool get isDraft => schedule?['status'] == 'draft';
  final List<Map<String, dynamic>> operatingHours;

  ScheduleState copyWith({
    ScheduleStatus? status,
    DateTime? selectedMonth,
    Map<String, dynamic>? schedule,
    List<Map<String, dynamic>>? availability,
    List<Map<String, dynamic>>? services,
    String? errorMessage,
    bool clearError = false,
    bool clearSchedule = false,
    List<Map<String, dynamic>>? operatingHours,
  }) {
    return ScheduleState(
      status: status ?? this.status,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      schedule: clearSchedule ? null : schedule ?? this.schedule,
      availability: availability ?? this.availability,
      services: services ?? this.services,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      operatingHours: operatingHours ?? this.operatingHours,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedMonth,
        schedule,
        availability,
        services,
        errorMessage,
        operatingHours,
      ];
}
