import 'package:equatable/equatable.dart';

class SpecialtyModel extends Equatable {
  final String id;
  final String name;

  const SpecialtyModel({required this.id, required this.name});

  factory SpecialtyModel.fromMap(Map<String, dynamic> map) {
    return SpecialtyModel(id: map['id'] as String, name: map['name'] as String);
  }

  @override
  List<Object?> get props => [id, name];
}
