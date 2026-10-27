import 'package:equatable/equatable.dart';

class MedicalServiceModel extends Equatable {
  final String id;
  final String specialtyId;
  final String name;
  final bool isActive;

  const MedicalServiceModel({
    required this.id,
    required this.specialtyId,
    required this.name,
    required this.isActive,
  });

  factory MedicalServiceModel.fromMap(Map<String, dynamic> map) {
    return MedicalServiceModel(
      id: map['id'] as String,
      specialtyId: map['specialty_id'] as String,
      name: map['name'] as String,
      isActive: map['is_active'] as bool,
    );
  }

  MedicalServiceModel copyWith({
    String? id,
    String? specialtyId,
    String? name,
    bool? isActive,
  }) {
    return MedicalServiceModel(
      id: id ?? this.id,
      specialtyId: specialtyId ?? this.specialtyId,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, specialtyId, name, isActive];
}
