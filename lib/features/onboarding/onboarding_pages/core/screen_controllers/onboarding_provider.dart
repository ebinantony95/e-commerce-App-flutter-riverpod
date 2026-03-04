import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/onboarding/onboarding_pages/core/services/onboarding_service.dart';

final onboardingServiceProvider = Provider<OnboardingService>((ref) {
  return OnboardingService();
});

final onboardingStatusProvider = FutureProvider.autoDispose<bool>((ref) async {
  return ref.read(onboardingServiceProvider).hasCompletedOnboarding();
});
