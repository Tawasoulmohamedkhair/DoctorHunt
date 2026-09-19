// doctor_details_model.dart
class DoctorDetailsModel {
  final String id;
  final String nameKey;
  final String specialtyKey;
  final String imageUrl;
  final double rating;
  final double pricePerHour;
  final bool isFavorite;
  final int running;
  final int ongoing;
  final int patients;
  final List<String> servicesKeys;

  const DoctorDetailsModel({
    required this.id,
    required this.nameKey,
    required this.specialtyKey,
    required this.imageUrl,
    required this.rating,
    required this.pricePerHour,
    this.isFavorite = false,
    required this.running,
    required this.ongoing,
    required this.patients,
    required this.servicesKeys,
  });

  DoctorDetailsModel copyWith({bool? isFavorite}) {
    return DoctorDetailsModel(
      id: id,
      nameKey: nameKey,
      specialtyKey: specialtyKey,
      imageUrl: imageUrl,
      rating: rating,
      pricePerHour: pricePerHour,
      isFavorite: isFavorite ?? this.isFavorite,
      running: running,
      ongoing: ongoing,
      patients: patients,
      servicesKeys: servicesKeys,
    );
  }
}
