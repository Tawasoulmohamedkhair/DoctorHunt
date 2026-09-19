import 'package:doctor_hunt/gen/assets.gen.dart';

import 'find_doctor_model.dart';

class FindDoctorData {
  static List<FindDoctorModel> getDoctors() {
    return [
      FindDoctorModel(
        id: '1',
        nameKey: 'shruti',
        specialtyKey: 'dentist',
        imageUrl:Assets.images.drfind1.path,
        yearsOfExperience: 7,
        ratingPercentage: 87,
        patientStoriesCount: 69,
        nextAvailableTime: '10:00 AM',
      ),
      FindDoctorModel(
        id: '2',
        nameKey: 'watamaniuk',
        specialtyKey: 'dentist',
        imageUrl:Assets.images.drfind2.path,
        yearsOfExperience: 9,
        ratingPercentage: 74,
        patientStoriesCount: 78,
        nextAvailableTime: '12:00 AM',
      ),
      FindDoctorModel(
        id: '3',
        nameKey: 'crownover',
        specialtyKey: 'dentist',
        imageUrl: Assets.images.live.path,
        yearsOfExperience: 5,
        ratingPercentage: 59,
        patientStoriesCount: 86,
        nextAvailableTime: '11:00 AM',
      ),
      FindDoctorModel(
        id: '4',
        nameKey: 'balestra',
        specialtyKey: 'dentist',
        imageUrl: Assets.images.feature1.path,
        yearsOfExperience: 6,
        ratingPercentage: 82,
        patientStoriesCount: 60,
        nextAvailableTime: '02:00 PM',
      ),
    ];
  }
}
