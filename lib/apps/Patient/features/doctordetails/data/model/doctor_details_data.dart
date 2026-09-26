import 'package:doctor_hunt/apps/Patient/features/doctordetails/data/model/doctor_details_model.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';

class DoctorDetailsData {
  static DoctorDetailsModel get sampleDoctor => DoctorDetailsModel(
    id: '1',

    // Doctor name
    nameKey: 'pediatrician',

    // Doctor specialty
    specialtyKey: 'specialistCardiologist',

    // Doctor image
    imageUrl: Assets.images.live.path,

    // Rating
    rating: 4.0,

    // Price
    pricePerHour: 28,

    // Statistics
    running: 100,
    ongoing: 500,
    patients: 700,
    

    // Services translation keys
    servicesKeys: ['patientCare', 'run', 'appointmentReminder'],
  );
}
