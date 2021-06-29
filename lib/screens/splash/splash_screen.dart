import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/splash/splash_screen_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> get splashTransitionTime => Future.delayed(
        const Duration(milliseconds: 1500),
      );

  @override
  void initState() {
    splashTransitionTime.whenComplete(
      () async {
        if (mounted) {
          await Navigator.pushReplacementNamed(context, RoutePaths.loginScreen);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kColAccentNormal,
      body: SafeArea(
        child: Center(
          child: AnimatedLogoWidget(),
        ),
      ),
    );
  }
}
