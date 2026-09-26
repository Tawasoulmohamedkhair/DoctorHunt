import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;
  final int index;
  final bool isRight;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.index,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    final page = context.t.onboarding.pages[index];

    //  final imageSize = (context.height * 0.32).clamp(120.0, 260.0);

    return Stack(
      children: [
        // Top ellipse.
        Positioned(
          top: -50,
          left: isRight ? null : -70,
          right: isRight ? -70 : null,
          child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
              ),
              //color: ,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Content.
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.w(30)),
          child: Column(
            children: [
              SizedBox(height: context.h(24)),

              // Doctor image.
              Container(
                width: 336,
                height: 336,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: context.h(24)),

              // Title.
              Text(
                page.title,
                textAlign: TextAlign.center,
                style: context.medium28textSecondary,
              ),

              SizedBox(height: context.h(12)),

              // Description.
              Text(
                page.description,
                textAlign: TextAlign.center,
                style: context.regular14textSub,
              ),

              SizedBox(height: context.h(24)),
            ],
          ),
        ),
      ],
    );
  }
}
