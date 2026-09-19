class FindDoctorModel {
  final String id;
  final String nameKey;
  final String specialtyKey;
  final String imageUrl;
  final int yearsOfExperience;
  final int ratingPercentage;
  final int patientStoriesCount;
  final String nextAvailableTime;
  final bool isFavorite;

  const FindDoctorModel({
    required this.id,
    required this.nameKey,
    required this.specialtyKey,
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
      specialtyKey: specialtyKey,
      imageUrl: imageUrl,
      yearsOfExperience: yearsOfExperience,
      ratingPercentage: ratingPercentage,
      patientStoriesCount: patientStoriesCount,
      nextAvailableTime: nextAvailableTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
