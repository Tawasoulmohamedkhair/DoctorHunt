import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboardin_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferences prefs;

  OnboardingCubit(this.prefs) : super(OnboardingInitial());

  static const String _key = 'hasSeenOnboarding';

  bool get hasSeenOnboarding {
    return prefs.getBool(_key) ?? false;
  }

  Future<void> checkOnboardingStatus() async {
    emit(OnboardingLoading());

    final hasSeen = prefs.getBool(_key) ?? false;

    if (hasSeen) {
      emit(OnboardingCompleted());
    } else {
      emit(OnboardingNotCompleted());
    }
  }

  Future<void> completeOnboarding() async {
    await prefs.setBool(_key, true);
    emit(OnboardingCompleted());
  }
}
