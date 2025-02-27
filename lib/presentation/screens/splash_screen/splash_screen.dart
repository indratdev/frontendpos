import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontendpos/data/others/shared_preferences.dart';
import 'package:frontendpos/presentation/screens/login_screen/login_screen.dart';
import 'package:frontendpos/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:frontendpos/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2)); // Timer diganti Future.delayed

    bool hasSeenOnboarding = await MySharedPref().getOnBoardingStatus();

    if (!mounted) return; // Cegah error jika state sudah di-dispose

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => hasSeenOnboarding ? LoginScreen() : OnboardingScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colorGreenDeep,
      body: Center(
        child: Image.asset(
          Constants.appWallpaper,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
