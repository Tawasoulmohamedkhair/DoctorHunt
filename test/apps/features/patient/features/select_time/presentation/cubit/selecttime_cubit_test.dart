import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/core/repository/appointment_repository.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/features/select_time/presentation/cubit/selecttime_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDoctorRepository extends Mock implements DoctorRepository {}

class MockAppointmentRepository extends Mock
    implements AppointmentRepository {}

void main() {
  late MockDoctorRepository doctorRepository;
  late MockAppointmentRepository appointmentRepository;

  const doctorId = 'doctor-1';
  const availabilityId = 'availability-1';
  const bookingId = 'booking-1';

  final now = DateTime.now();
  final futureDate = DateTime(now.year, now.month, now.day + 3);
  final month = DateTime(futureDate.year, futureDate.month);

  Map<String, dynamic> availability({
    String id = availabilityId,
    DateTime? date,
    String startTime = '09:00:00',
    String endTime = '11:00:00',
    int duration = 30,
  }) {
    final workDate = date ?? futureDate;

    return {
      'id': id,
      'doctor_id': doctorId,
      'work_date':
          '${workDate.year.toString().padLeft(4, '0')}-'
          '${workDate.month.toString().padLeft(2, '0')}-'
          '${workDate.day.toString().padLeft(2, '0')}',
      'shift': 'morning',
      'start_time': startTime,
      'end_time': endTime,
      'slot_duration_minutes': duration,
    };
  }

  setUp(() {
    doctorRepository = MockDoctorRepository();
    appointmentRepository = MockAppointmentRepository();
  });

  group('SelectTimeCubit', () {
    group('loadMonth', () {
      blocTest<SelectTimeCubit, SelectTimeState>(
        'emits loading then available time slots',
        build: () {
          when(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).thenAnswer(
            (_) async => [
              availability(),
            ],
          );

          when(
            () => doctorRepository.getBookedSlots([availabilityId]),
          ).thenAnswer((_) async => []);

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        act: (cubit) => cubit.loadMonth(doctorId, month),
        expect: () => [
          SelectTimeState(
            displayedMonth: month,
            isLoading: true,
          ),
          isA<SelectTimeState>()
              .having(
                (state) => state.displayedMonth,
                'displayedMonth',
                month,
              )
              .having(
                (state) => state.isLoading,
                'isLoading',
                false,
              )
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                isNull,
              )
              .having(
                (state) => state.slotsByDate[futureDate]?.length,
                'number of available slots',
                4,
              ),
        ],
        verify: (_) {
          verify(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).called(1);

          verify(
            () => doctorRepository.getBookedSlots([availabilityId]),
          ).called(1);
        },
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'does not request booked slots when availability is empty',
        build: () {
          when(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).thenAnswer((_) async => []);

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        act: (cubit) => cubit.loadMonth(doctorId, month),
        expect: () => [
          SelectTimeState(
            displayedMonth: month,
            isLoading: true,
          ),
          SelectTimeState(displayedMonth: month),
        ],
        verify: (_) {
          verifyNever(
            () => doctorRepository.getBookedSlots(any()),
          );
        },
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'excludes booked time slots',
        build: () {
          when(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).thenAnswer(
            (_) async => [
              availability(),
            ],
          );

          when(
            () => doctorRepository.getBookedSlots([availabilityId]),
          ).thenAnswer(
            (_) async => [
              {
                'availability_id': availabilityId,
                'appointment_time': '09:30:00',
              },
            ],
          );

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        act: (cubit) => cubit.loadMonth(doctorId, month),
        expect: () => [
          SelectTimeState(
            displayedMonth: month,
            isLoading: true,
          ),
          isA<SelectTimeState>().having(
            (state) => state.slotsByDate[futureDate]!
                .map((slot) => slot.time)
                .toList(),
            'available times',
            ['09:00', '10:00', '10:30'],
          ),
        ],
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'ignores availability with an invalid slot duration',
        build: () {
          when(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).thenAnswer(
            (_) async => [
              availability(duration: 0),
            ],
          );

          when(
            () => doctorRepository.getBookedSlots([availabilityId]),
          ).thenAnswer((_) async => []);

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        act: (cubit) => cubit.loadMonth(doctorId, month),
        expect: () => [
          SelectTimeState(
            displayedMonth: month,
            isLoading: true,
          ),
          isA<SelectTimeState>().having(
            (state) => state.slotsByDate,
            'slotsByDate',
            isEmpty,
          ),
        ],
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'emits an error state when loading availability fails',
        build: () {
          when(
            () => doctorRepository.getDoctorAvailabilityForMonth(
              doctorId: doctorId,
              month: month,
            ),
          ).thenThrow(Exception('Database error'));

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        act: (cubit) => cubit.loadMonth(doctorId, month),
        expect: () => [
          SelectTimeState(
            displayedMonth: month,
            isLoading: true,
          ),
          isA<SelectTimeState>()
              .having(
                (state) => state.isLoading,
                'isLoading',
                false,
              )
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                isNotNull,
              ),
        ],
      );
    });

    group('selectDate', () {
      final slot = BookingTimeSlot(
        availabilityId: availabilityId,
        time: '09:00',
        label: '9:00 AM',
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'selects an available date',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.selectDate(
          DateTime(
            futureDate.year,
            futureDate.month,
            futureDate.day,
            15,
          ),
        ),
        expect: () => [
          isA<SelectTimeState>()
              .having(
                (state) => state.selectedDate,
                'selectedDate',
                futureDate,
              )
              .having(
                (state) => state.selectedSlot,
                'selectedSlot',
                isNull,
              ),
        ],
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'does not select a date without available slots',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.selectDate(
          DateTime(futureDate.year, futureDate.month, futureDate.day + 1),
        ),
        expect: () => <SelectTimeState>[],
      );
    });

    group('selectTime', () {
      final slot = BookingTimeSlot(
        availabilityId: availabilityId,
        time: '09:00',
        label: '9:00 AM',
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'selects a time belonging to the selected date',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          selectedDate: futureDate,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.selectTime(slot),
        expect: () => [
          isA<SelectTimeState>().having(
            (state) => state.selectedSlot,
            'selectedSlot',
            slot,
          ),
        ],
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'ignores time selection when no date is selected',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.selectTime(slot),
        expect: () => <SelectTimeState>[],
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'ignores a time that does not belong to the selected date',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          selectedDate: futureDate,
          slotsByDate: {
            futureDate: [
              slot,
            ],
          },
        ),
        act: (cubit) => cubit.selectTime(
          const BookingTimeSlot(
            availabilityId: 'other-availability',
            time: '10:00',
            label: '10:00 AM',
          ),
        ),
        expect: () => <SelectTimeState>[],
      );
    });

    group('confirmBooking', () {
      final slot = BookingTimeSlot(
        availabilityId: availabilityId,
        time: '09:00',
        label: '9:00 AM',
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'books an appointment successfully',
        build: () {
          when(
            () => appointmentRepository.bookAppointment(
              availabilityId: availabilityId,
              appointmentTime: '09:00:00',
            ),
          ).thenAnswer((_) async => bookingId);

          return SelectTimeCubit(
            doctorRepository,
            appointmentRepository,
          );
        },
        seed: () => SelectTimeState(
          displayedMonth: month,
          selectedDate: futureDate,
          selectedSlot: slot,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.confirmBooking(doctorId: doctorId),
        expect: () => [
          isA<SelectTimeState>()
              .having(
                (state) => state.isBooking,
                'isBooking',
                true,
              )
              .having(
                (state) => state.bookingId,
                'bookingId',
                isNull,
              ),
          isA<SelectTimeState>()
              .having(
                (state) => state.isBooking,
                'isBooking',
                false,
              )
              .having(
                (state) => state.bookingId,
                'bookingId',
                bookingId,
              )
              .having(
                (state) => state.bookingError,
                'bookingError',
                isNull,
              ),
        ],
        verify: (_) {
          verify(
            () => appointmentRepository.bookAppointment(
              availabilityId: availabilityId,
              appointmentTime: '09:00:00',
            ),
          ).called(1);
        },
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'does not book when no time slot is selected',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          selectedDate: futureDate,
        ),
        act: (cubit) => cubit.confirmBooking(doctorId: doctorId),
        expect: () => <SelectTimeState>[],
        verify: (_) {
          verifyNever(
            () => appointmentRepository.bookAppointment(
              availabilityId: any(named: 'availabilityId'),
              appointmentTime: any(named: 'appointmentTime'),
            ),
          );
        },
      );

      blocTest<SelectTimeCubit, SelectTimeState>(
        'does not book while loading',
        build: () => SelectTimeCubit(
          doctorRepository,
          appointmentRepository,
        ),
        seed: () => SelectTimeState(
          displayedMonth: month,
          selectedDate: futureDate,
          selectedSlot: slot,
          isLoading: true,
          slotsByDate: {
            futureDate: [slot],
          },
        ),
        act: (cubit) => cubit.confirmBooking(doctorId: doctorId),
        expect: () => <SelectTimeState>[],
        verify: (_) {
          verifyNever(
            () => appointmentRepository.bookAppointment(
              availabilityId: any(named: 'availabilityId'),
              appointmentTime: any(named: 'appointmentTime'),
            ),
          );
        },
      );
    });
  });
}
