import 'package:doctor_hunt/apps/Patient/features/home/enum/doctor_specialty.dart';

class DoctorModel {
  final String id;
  final String nameKey;
  final DoctorSpecialty specialty;
  final String imageUrl;
  final double rating;
  final double pricePerHour;
  final bool isLive;
  final bool isFavorite;

  const DoctorModel({
    required this.id,
    required this.nameKey,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.pricePerHour,
    this.isLive = false,
    this.isFavorite = false,
  });

  DoctorModel copyWith({bool? isFavorite}) {
    return DoctorModel(
      id: id,
      nameKey: nameKey,
      specialty: specialty,
      imageUrl: imageUrl,
      rating: rating,
      pricePerHour: pricePerHour,
      isLive: isLive,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
