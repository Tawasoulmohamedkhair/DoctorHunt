// ==================== Categories ====================

import 'package:doctor_hunt/apps/Patient/features/home/data/model/categories_data.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});
  final CategoriesData categories = CategoriesData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.categories.map((cat) {
          return Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              color: cat['color'] as Color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(
                cat['image'] as String,
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
