class DoctorModel {
  final String id;
  final String nameKey;
  final String specialtyKey;
  final String imageUrl;
  final double rating;
  final double pricePerHour;
  final bool isLive;
  final bool isFavorite;

  const DoctorModel({
    required this.id,
    required this.nameKey,
    required this.specialtyKey,
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
      specialtyKey: specialtyKey,
      imageUrl: imageUrl,
      rating: rating,
      pricePerHour: pricePerHour,
      isLive: isLive,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
