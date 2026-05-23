import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/controller/attendance_controller.dart';
import 'package:daffy/controller/home_controller.dart';
import 'package:daffy/views/screens/widgets/status_badge.dart';
import 'package:daffy/views/widgets/custom_button_widget.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceCard extends StatelessWidget {
  AttendanceCard({super.key});

  final AttendanceController attendanceController =
      Get.find<AttendanceController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffE0E0E0), width: 1),
      ),
      child: Obx(() {
        final isActive = attendanceController.isCheckedIn.value;
        final current = attendanceController.currentAttendance.value;

        final displayTime = isActive && current != null
            ? _formatTime(current.checkIn)
            : DateFormat('hh:mm a').format(DateTime.now());

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: 'Attendance',
                  color: kSecondary,
                  fontFamily: AppFonts.pjs700,
                  fontSize: 18,
                ),
                statusBadge(isActive),
              ],
            ),
            const SizedBox(height: 12),

            // Time row
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: kGrey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                CustomTextWidget(
                  text: displayTime,
                  color: kSecondary,
                  fontFamily: AppFonts.pjs700,
                  fontSize: 22,
                ),
              ],
            ),
            const SizedBox(height: 20),

        
            CustomButtonWidget(
              isLoading: attendanceController.isCheckingIn.value,
              onPressed: () => _handleButtonPress(isActive),
              btnName: isActive ? 'Check Out Now' : 'Check In Now',
              btnColor: const Color(0xff2DD4BF),
              color: kWhite,
              height: 52,
              width: double.infinity,
              fontSize: 16,
            ),
          ],
        );
      }),
    );
  }

 
 


  String _formatTime(String dateTime) {
    try {
      final dt = DateTime.parse(dateTime);
      return DateFormat('hh:mm a').format(dt);
    } catch (_) {
      return dateTime;
    }
  }

  void _handleButtonPress(bool isActive) {
    final user = homeController.user.value;
    final distributor = homeController.selectedDistributor.value;
    final route = homeController.selectedRoute.value;

    if (user == null) {
      Get.snackbar('Error', 'User not loaded');
      return;
    }

    if (isActive) {
   
      final current = attendanceController.currentAttendance.value;
      if (current == null) return;

      attendanceController.checkOut(
       
      );
    } else {
   
      if (distributor == null || route == null) {
        Get.snackbar(
          'Select Required',
          'Please select distributor and route first',
        );
        return;
      }

      attendanceController.checkIn(
        userId: user.id,
        distributor: distributor,
        route: route,
      );
    }
  }
}