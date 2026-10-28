
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/data/model/categories_data.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriesData', () {
    late CategoriesData categoriesData;

    setUp(() {
      categoriesData = CategoriesData();
    });

    test('contains four categories', () {
      expect(categoriesData.categories, hasLength(4));
    });

    test('each category contains an image and a color', () {
      for (final category in categoriesData.categories) {
        expect(category['image'], isA<String>());
        expect(category['color'], isA<Color>());
      }
    });

    test('uses the expected category images', () {
      expect(
        categoriesData.categories.map((category) => category['image']),
        [
          Assets.images.dentistImage.path,
          Assets.images.heartHealth.path,
          Assets.images.visionImage.path,
          Assets.images.brain.path,
        ],
      );
    });

    test('uses the expected category colors', () {
      expect(
        categoriesData.categories.map((category) => category['color']),
        [
          AppColors.moderate,
          AppColors.cyan,
          AppColors.yellow,
          AppColors.redaura,
        ],
      );
    });
  });
}
