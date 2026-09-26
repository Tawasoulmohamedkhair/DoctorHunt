// ==================== Categories ====================

import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/features/home/data/model/categories_data.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});
  final CategoriesData categories = CategoriesData();
  @override
  Widget build(BuildContext context) {
     return Padding(
  padding: EdgeInsets.all(context.w(8)),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: categories.categories.map((cat) {
      return Container(
        width: context.w(80),
        height: context.h(90),
        decoration: BoxDecoration(
          color: cat['color'] as Color,
          borderRadius: BorderRadius.circular(context.r(16)),
        ),
        child: Center(
          child: Image.asset(
            cat['image'] as String,
            width: context.w(35),
            height: context.w(35),
            fit: BoxFit.contain,
          ),
        ),
      );
    }).toList(),
  ),
);
  }
}
