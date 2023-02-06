import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/screens/auth_gate.dart';
import '../common/styles/app_themes.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AuthGate.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppThemes.white,
        body: Center(child: Icon(Icons.fireplace_sharp)));

  }
}
