
class AppointmentModel {
  final String id;
  final String status;
  final String doctorName;
  final String specialtyName;
  final String? doctorId;
  final String? imageUrl;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? serviceName;
  final num? fee;
  final bool hasReview;

  const AppointmentModel({
    required this.id,
    required this.status,
    required this.doctorName,
    required this.specialtyName,
    this.doctorId,
    this.imageUrl,
    this.appointmentDate,
    this.appointmentTime,
    this.serviceName,
    this.fee,
    required this.hasReview,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    final availability = _asMap(json['doctor_availability']);
    final doctor = _asMap(availability['doctors']);
    final specialty = _asMap(doctor['specialties']);
    final service = _asMap(availability['medical_services']);
    final reviews = json['reviews'];

    return AppointmentModel(
      id: json['id'].toString(),
      status: json['status'] as String? ?? '',
      doctorName: doctor['full_name'] as String? ?? 'Doctor',
      specialtyName: specialty['name'] as String? ?? 'Specialist',
      doctorId: doctor['id']?.toString(),
      imageUrl: doctor['image_url'] as String?,
      appointmentDate: availability['work_date']?.toString(),
      appointmentTime: json['appointment_time']?.toString(),
      serviceName: service['name'] as String?,
      fee: json['fee_at_booking'] as num?,
      hasReview: reviews is List && reviews.isNotEmpty,
    );
  }

  static Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;

    if (value is List && value.isNotEmpty) {
      final first = value.first;
      if (first is Map<String, dynamic>) return first;
    }

    return {};
  }
}
