 import 'package:daffy/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../widgets/custom_text_widget.dart';

Widget tabs(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [tabItem('Day', 0, controller), tabItem('Month', 1, controller), tabItem('Year', 2, controller)],
      ),
    );
  }

  Widget tabItem(String label, int index, HomeController controller) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedTab.value == index;
        return GestureDetector(
          onTap: () => controller.changeTab(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? kWhite : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow:
                  isSelected
                      ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                      : [],
            ),
            alignment: Alignment.center,
            child: CustomTextWidget(
              text: label,

              fontFamily: AppFonts.pjs600,
              fontSize: 13,
              color: isSelected ? kSecondary : kGrey,
            ),
          ),
        );
      }),
    );
  }
