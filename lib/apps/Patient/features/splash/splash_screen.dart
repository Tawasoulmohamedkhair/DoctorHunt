import 'package:doctor_hunt/apps/Patient/core/di/injection.dart';
import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_routers.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String _onboardingKey = 'hasSeenOnboarding';

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = getIt<SharedPreferences>();
    final hasSeenOnboarding = prefs.getBool(_onboardingKey) ?? false;

    if (!mounted) return;

    if (hasSeenOnboarding) {
      const ChooseRoleRoute().go(context);
    } else {
      const OnboardingRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.bg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logo.path,
                width: context.w(70),
                height: context.w(70),
              ),
              SizedBox(height: context.h(11)),
              Text(t.appName, style: context.semiBold25textMain),
            ],
          ),
        ),
      ),
    );
  }
}
