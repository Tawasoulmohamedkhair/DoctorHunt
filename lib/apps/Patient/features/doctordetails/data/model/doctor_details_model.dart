// doctor_details_model.dart
import 'package:doctor_hunt/apps/Patient/features/doctordetails/enum/doctor_service.dart';
import 'package:doctor_hunt/apps/Patient/features/home/enum/doctor_specialty.dart';

class DoctorDetailsModel {
  final String id;
  final String nameKey;
  final DoctorSpecialty specialty;
  final String imageUrl;
  final double rating;
  final double pricePerHour;
  final bool isFavorite;
  final int running;
  final int ongoing;
  final int patients;
final List<DoctorService> services;
  const DoctorDetailsModel({
    required this.id,
    required this.nameKey,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.pricePerHour,
    this.isFavorite = false,
    required this.running,
    required this.ongoing,
    required this.patients,
    required this.services,
  });

  DoctorDetailsModel copyWith({bool? isFavorite}) {
    return DoctorDetailsModel(
      id: id,
      nameKey: nameKey,
      specialty: specialty,
      imageUrl: imageUrl,
      rating: rating,
      pricePerHour: pricePerHour,
      isFavorite: isFavorite ?? this.isFavorite,
      running: running,
      ongoing: ongoing,
      patients: patients,
      services: services,
    );
  }
}
