import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String clinicLocation;
  final double? latitude;
  final double? longitude;

  const AdminModel({
    required this.fullName,
    required this.email,
    this.avatarUrl,
    required this.clinicLocation,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
    fullName,
    email,
    avatarUrl,
    clinicLocation,
    latitude,
    longitude,
  ];
}
