import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import 'home_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = "/dashboard";
  DashboardScreen({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: _dashboardController.currentIndex.value,
            children: [
              HomeScreen(),

            ],
          )),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
