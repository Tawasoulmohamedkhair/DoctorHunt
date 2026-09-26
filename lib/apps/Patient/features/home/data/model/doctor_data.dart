import 'package:doctor_hunt/apps/Patient/features/home/data/model/doctor_model.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';

class DoctorsData {
  static List<DoctorModel> get liveDoctors => [
     DoctorModel(
      id: '1',
      nameKey: 'ahmedHassan',
      specialtyKey: 'cardiologist',
      imageUrl: Assets.images.live.path,
      rating: 4.9,
      pricePerHour: 50,
      isLive: true,
    ),
     DoctorModel(
      id: '2',
      nameKey: 'mohamedAli',
      specialtyKey: 'surgeon',
      imageUrl: Assets.images.hospital.path,
      rating: 4.8,
      pricePerHour: 55,
      isLive: true,
    ),
     DoctorModel(
      id: '3',
      nameKey: 'khaledOmar',
      specialtyKey: 'surgeon',
      imageUrl: Assets.images.feature1.path,
      rating: 4.7,
      pricePerHour: 48,
      isLive: true,
    ),
  ];

  static List<DoctorModel> get popularDoctors => [
     DoctorModel(
      id: '4',
      nameKey: 'fillerupGrab',
      specialtyKey: 'medicineSpecialist',
      imageUrl: Assets.images.live.path,
      rating: 4.5,
      pricePerHour: 28,
    ),
     DoctorModel(
      id: '5',
      nameKey: 'youssefIbrahim',
      specialtyKey: 'dentistSpecialist',
      imageUrl: Assets.images.populre2.path,
      rating: 4.8,
      pricePerHour: 32,
    ),
  ];

  static List<DoctorModel> get featuredDoctors => [
     DoctorModel(
      id: '6',
      nameKey: 'crick',
      specialtyKey: 'general',
      imageUrl: Assets.images.populare1.path,
      rating: 3.7,
      pricePerHour: 25,
    ),
     DoctorModel(
      id: '7',
      nameKey: 'strain',
      specialtyKey: 'cardiologist',
      imageUrl: Assets.images.feature2.path,
      rating: 3.0,
      pricePerHour: 22,
    ),
     DoctorModel(
      id: '8',
      nameKey: 'lachinet',
      specialtyKey: 'neurologist',
      imageUrl: Assets.images.feature1.path,
      rating: 2.9,
      pricePerHour: 29,
    ),
  ];
}
