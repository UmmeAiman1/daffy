import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/controller/bottom_nav_bar_controller.dart';
import 'package:daffy/views/screens/history_screen.dart';
import 'package:daffy/views/screens/home_screen.dart';
import 'package:daffy/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_images.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavController controller = Get.find<BottomNavController>();

  final List<Widget> screens = [
    HomeScreen(),
   HistoryScreen(),
    ProfileScreen(),
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: screens,
        ),
      ),
   
      bottomNavigationBar: Obx(
        () {
          final currentIndex = controller.currentIndex.value;
          return BottomNavigationBar(
            backgroundColor: kWhite,
            currentIndex: currentIndex,
            selectedItemColor: kSecondary,
            unselectedItemColor: kGrey,
            onTap: controller.changIndex,
            items: [
              _buildNavItem(Assets.imagesHome, 'Home', currentIndex == 0),
              _buildNavItem(Assets.imagesHistory, 'History', currentIndex == 1),
              _buildNavItem(Assets.imagesProfile, 'Profile', currentIndex == 2),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String assetPath,
    String label,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetPath,
        color: isSelected ? kSecondary : kGrey,
        height: 24,
      ),
      label: label,
    );
  }
}