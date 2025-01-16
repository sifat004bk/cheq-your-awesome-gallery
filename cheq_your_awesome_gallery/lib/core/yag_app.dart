import 'package:cheq_your_awesome_gallery/feature/onboarding/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class YAGApp extends StatelessWidget {
  const YAGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
