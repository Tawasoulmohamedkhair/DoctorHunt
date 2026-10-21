import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String id;
  final String fullName;
  final String specialtyId;
  final String specialtyName;
  final String? imageUrl;
  final double rating;
  final int reviewsCount;
  final double fee;
  final bool isActive;

  const DoctorModel({
    required this.id,
    required this.fullName,
    required this.specialtyId,
    required this.specialtyName,
    this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.fee,
    required this.isActive,
  });

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    final specialty = map['specialties'] as Map<String, dynamic>?;

    return DoctorModel(
      id: map['id'] as String,
      fullName: map['full_name'] as String,
      specialtyId: map['specialty_id'] as String,
      specialtyName: specialty?['name'] as String? ?? '',
      imageUrl: map['image_url'] as String?,
      rating: (map['rating'] as num).toDouble(),
      reviewsCount: map['reviews_count'] as int,
      fee: (map['fee'] as num).toDouble(),
      isActive: map['is_active'] as bool,
    );
  }

  DoctorModel copyWith({
    String? id,
    String? fullName,
    String? specialtyId,
    String? specialtyName,
    String? imageUrl,
    double? rating,
    int? reviewsCount,
    double? fee,
    bool? isActive,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      specialtyId: specialtyId ?? this.specialtyId,
      specialtyName: specialtyName ?? this.specialtyName,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      fee: fee ?? this.fee,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    specialtyId,
    specialtyName,
    imageUrl,
    rating,
    reviewsCount,
    fee,
    isActive,
  ];
}
