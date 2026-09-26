import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/data/models/onboarding_data.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/onboarding/presentation/widgets/onbarding_page.dart';
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
  late final PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

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

  void _onPageChanged(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });
  }

  void _onNextPressed() {
    final isLastPage = _currentIndex == onboardingData.length - 1;

    if (isLastPage) {
      _goToChooseRole();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentIndex == onboardingData.length - 1;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Onboarding pages.
          Positioned.fill(
            bottom: context.h(130),
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  item: onboardingData[index],
                  index: index,
                  isRight: onboardingData[index].isRight,
                );
              },
            ),
          ),

          // Bottom buttons.
          Positioned(
            left: 0,
            right: 0,
            bottom: context.h(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.w(40)),
                  child: SizedBox(
                    width: double.infinity,
                    height: context.h(53),
                    child: ElevatedButton(
                      onPressed: _onNextPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.r(12)),
                        ),
                      ),
                      child: Text(
                        isLastPage ? t.getStarted : t.next,
                        style: context.medium18white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.h(8)),
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
