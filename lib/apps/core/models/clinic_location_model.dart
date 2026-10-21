class ClinicLocationModel {
  final String? location;
  final double? latitude;
  final double? longitude;

  const ClinicLocationModel({
    this.location,
    this.latitude,
    this.longitude,
  });

  factory ClinicLocationModel.fromMap(Map<String, dynamic> map) {
    return ClinicLocationModel(
      location: map['location']?.toString(),
      latitude: _toDouble(map['latitude']),
      longitude: _toDouble(map['longitude']),
    );
  }

  static double? _toDouble(dynamic value) {
    final result = value is num
        ? value.toDouble()
        : double.tryParse(value?.toString() ?? '');

    return result != null && result.isFinite ? result : null;
  }
}
