import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/data/models/onboarding_data.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/cubit/onboardin_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/screen/onbarding.dart';
import 'package:doctor_hunt/gen/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToChooseRole() async {
    await context.read<OnboardingCubit>().completeOnboarding();

    if (!mounted) return;

    const ChooseRoleRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.common;

    return Scaffold(
      backgroundColor: AppColors.white,

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bottom right ellipse
          Positioned(
            bottom: -30,
            right: -40,
            child: Image.asset(
              Assets.images.ellipse.path,
              width: 216,
              height: 216,
              fit: BoxFit.contain,
            ),
          ),

          // Onboarding pages
          Positioned.fill(
            bottom: 130,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,

              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

              itemBuilder: (context, index) {
                final item = onboardingData[index];

                return OnboardingPage(item: item, index: index);
              },
            ),
          ),

          // Bottom buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (currentIndex == onboardingData.length - 1) {
                          await _goToChooseRole();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        currentIndex == onboardingData.length - 1
                            ? t.getStarted
                            : t.next,
                        style: context.medium18white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                TextButton(
                  onPressed: _goToChooseRole,
                  child: Text(t.skip, style: context.regular14textSub),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
