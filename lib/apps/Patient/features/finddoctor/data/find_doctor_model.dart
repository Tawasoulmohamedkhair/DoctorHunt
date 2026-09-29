import 'package:doctor_hunt/apps/Patient/features/home/enum/doctor_specialty.dart';

class FindDoctorModel {
  final String id;
  final String nameKey;
final DoctorSpecialty specialty; 
 final String imageUrl;
  final int yearsOfExperience;
  final int ratingPercentage;
  final int patientStoriesCount;
  final String nextAvailableTime;
  final bool isFavorite;

  const FindDoctorModel({
    required this.id,
    required this.nameKey,
    required this.specialty,
    required this.imageUrl,
    required this.yearsOfExperience,
    required this.ratingPercentage,
    required this.patientStoriesCount,
    required this.nextAvailableTime,
    this.isFavorite = false,
  });

  FindDoctorModel copyWith({bool? isFavorite}) {
    return FindDoctorModel(
      id: id,
      nameKey: nameKey,
      specialty: specialty,
      imageUrl: imageUrl,
      yearsOfExperience: yearsOfExperience,
      ratingPercentage: ratingPercentage,
      patientStoriesCount: patientStoriesCount,
      nextAvailableTime: nextAvailableTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
