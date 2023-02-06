import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mgm_client_app/splash/splash_screen.dart';
import 'common/app_routes.dart';
import 'common/bindings/bindings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppBindings().dependencies();
  runApp(DevicePreview(
    enabled: false,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      debugShowCheckedModeBanner: false,
      title: 'MGM',
      themeMode: ThemeMode.light,
      // theme: AppThemes.lightTheme,
      initialRoute: SplashScreen.routeName,
      getPages: AppRoutes.routes,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      // home: const Scaffold(),
    );


  }
}

