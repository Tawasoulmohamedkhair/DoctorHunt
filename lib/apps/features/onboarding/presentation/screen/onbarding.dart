import 'package:doctor_hunt/apps/features/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;
  final int index;

  const OnboardingPage({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final page = context.t.onboarding.pages[index];

    return Stack(
      children: [
        // Background ellipse
        Positioned.directional(
          textDirection: TextDirection.ltr,
          top: -30,
          end: item.isCircleRight ? -110 : null,
          start: item.isCircleRight ? null : -110,
          child: Image.asset(
            item.isCircleRight
                ? 'assets/images/ellipse1.png'
                : 'assets/images/ellipses.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),

        // Onboarding content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Doctor image
              Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Title
              Text(
                page.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              const SizedBox(height: 16),

              // Description
              Text(
                page.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
