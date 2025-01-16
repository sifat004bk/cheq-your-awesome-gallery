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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimationY;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bounceAnimationY = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animationController.forward();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        PermissionScreen.route(),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _bounceAnimationY,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0.0, _bounceAnimationY.value),
              child: Opacity(
                opacity: 1.0,
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
