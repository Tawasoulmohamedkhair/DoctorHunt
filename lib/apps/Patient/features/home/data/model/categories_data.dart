import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';

class CategoriesData {
  final categories = [
    {'image': Assets.images.dentistImage.path, 'color': AppColors.moderate},
    {'image': Assets.images.heartHealth.path, 'color': AppColors.cyan},
    {'image': Assets.images.visionImage.path, 'color': AppColors.yellow},
    {'image': Assets.images.brain.path, 'color': AppColors.redaura},
  ];
}
