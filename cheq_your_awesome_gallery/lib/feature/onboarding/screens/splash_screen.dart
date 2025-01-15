import 'package:cheq_your_awesome_gallery/feature/onboarding/screens/permission_screen.dart';
import 'package:cheq_your_awesome_gallery/resources/asset_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const path = '/splashScreen';

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PermissionScreen.route(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          builder: (context, double value, child) {
            return Transform.scale(
              scale: 1 + (value * 0.5),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: Image.asset(AssetHelper.logo),
        ),
      ),
    );
  }
}
