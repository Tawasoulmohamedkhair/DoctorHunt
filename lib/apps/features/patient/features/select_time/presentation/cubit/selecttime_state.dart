import 'package:equatable/equatable.dart';

class BookingTimeSlot extends Equatable {
  final String availabilityId;
  final String time;
  final String label;

  const BookingTimeSlot({
    required this.availabilityId,
    required this.time,
    required this.label,
  });

  @override
  List<Object?> get props => [availabilityId, time, label];
}

class SelectTimeState extends Equatable {
  final DateTime displayedMonth;
  final DateTime? selectedDate;
  final BookingTimeSlot? selectedSlot;
  final Map<DateTime, List<BookingTimeSlot>> slotsByDate;
  final bool isLoading;
  final String? errorMessage;

  final bool isBooking;
  final String? bookingError;
  final String? bookingId;

  const SelectTimeState({
    required this.displayedMonth,
    this.selectedDate,
    this.selectedSlot,
    this.slotsByDate = const {},
    this.isLoading = false,
    this.errorMessage,
    this.isBooking = false,
    this.bookingError,
    this.bookingId,
  });

  List<BookingTimeSlot> get selectedDateSlots {
    if (selectedDate == null) return [];

    final key = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
    );

    return slotsByDate[key] ?? [];
  }

  bool isDateAvailable(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    return slotsByDate[key]?.isNotEmpty ?? false;
  }

  SelectTimeState copyWith({
    DateTime? displayedMonth,
    DateTime? selectedDate,
    BookingTimeSlot? selectedSlot,
    Map<DateTime, List<BookingTimeSlot>>? slotsByDate,
    bool? isLoading,
    String? errorMessage,
    bool? isBooking,
    String? bookingError,
    String? bookingId,
    bool clearSelectedDate = false,
    bool clearSelectedSlot = false,
    bool clearError = false,
    bool clearBookingError = false,
    bool clearBookingId = false,
  }) {
    return SelectTimeState(
      displayedMonth: displayedMonth ?? this.displayedMonth,
      selectedDate: clearSelectedDate
          ? null
          : selectedDate ?? this.selectedDate,
      selectedSlot: clearSelectedSlot
          ? null
          : selectedSlot ?? this.selectedSlot,
      slotsByDate: slotsByDate ?? this.slotsByDate,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isBooking: isBooking ?? this.isBooking,
      bookingError: clearBookingError
          ? null
          : bookingError ?? this.bookingError,
      bookingId: clearBookingId ? null : bookingId ?? this.bookingId,
    );
  }

  @override
  List<Object?> get props => [
    displayedMonth,
    selectedDate,
    selectedSlot,
    slotsByDate,
    isLoading,
    errorMessage,
    isBooking,
    bookingError,
    bookingId,
  ];
}
