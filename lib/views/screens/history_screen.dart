import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/controller/attendance_controller.dart';
import 'package:daffy/models/attendance_model.dart';
import 'package:daffy/views/widgets/custom_button_widget.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final AttendanceController controller = Get.find<AttendanceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffwhite,
      appBar: AppBar(
        backgroundColor: kOffwhite,
        elevation: 0.2,
        shadowColor: Colors.grey.withOpacity(0.5),
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Attendance History',
          color: kSecondary,
          fontFamily: AppFonts.pjs700,
          fontSize: 18,
        ),
      ),
      body: Obx(() {
        if (controller.attendances.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.history,
                  size: 64,
                  color: kGrey,
                ),
                SizedBox(height: h(context, 16)),
                CustomTextWidget(
                  text: 'No attendance records yet',
                  color: kGrey,
                  fontFamily: AppFonts.pjs400,
                  fontSize: 16,
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: all(context, 16),
          itemCount: controller.attendances.length,
          separatorBuilder: (_, __) => SizedBox(height: h(context, 12)),
          itemBuilder: (context, index) {
            // Newest first
            final attendance = controller.attendances[
                controller.attendances.length - 1 - index];
            return _AttendanceRecordCard(
              attendance: attendance,
              controller: controller,
            );
          },
        );
      }),
    );
  }
}

class _AttendanceRecordCard extends StatelessWidget {
  final AttendanceModel attendance;
  final AttendanceController controller;

  const _AttendanceRecordCard({
    required this.attendance,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0E0E0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: date + posted status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: attendance.date,
                color: kSecondary,
                fontFamily: AppFonts.pjs700,
                fontSize: 15,
              ),
              _buildStatusChip(attendance.isPosted),
            ],
          ),
          SizedBox(height: h(context, 12)),

          // Distributor
          _infoRow(
            context,
            icon: Icons.business,
            label: 'Distributor',
            value: attendance.distributorName,
          ),
          SizedBox(height: h(context, 8)),

          // Route
          _infoRow(
            context,
            icon: Icons.route_outlined,
            label: 'Route',
            value: attendance.routeName,
          ),
          SizedBox(height: h(context, 8)),

          // Check-in time
          _infoRow(
            context,
            icon: Icons.login,
            label: 'Check In',
            value: attendance.checkIn,
          ),
          SizedBox(height: h(context, 8)),

          // Check-out time
          _infoRow(
            context,
            icon: Icons.logout,
            label: 'Check Out',
            value: attendance.checkOut ?? 'Not checked out',
          ),
          SizedBox(height: h(context, 14)),

          // POST button — sirf jab posted nahi hai
          if (!attendance.isPosted)
            Obx(() => CustomButtonWidget(
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.postAttendance(attendance),
                  btnName: 'POST',
                  btnColor: const Color(0xff2DD4BF),
                  color: kWhite,
                  height: 44,
                  width: double.infinity,
                  fontSize: 14,
                )),
        ],
      ),
    );
  }

  Widget _buildStatusChip(bool isPosted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPosted
            ? const Color(0xffE6FAF5)
            : const Color(0xffFEF3C7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomTextWidget(
        text: isPosted ? 'Posted' : 'Pending',
        color: isPosted
            ? const Color(0xff2DD4BF)
            : const Color(0xffF59E0B),
        fontFamily: AppFonts.pjs400,
        fontSize: 11,
      ),
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: kGrey),
        SizedBox(width: h(context, 8)),
        CustomTextWidget(
          text: '$label: ',
          color: kGrey,
          fontFamily: AppFonts.pjs400,
          fontSize: 12,
        ),
        Expanded(
          child: CustomTextWidget(
            text: value,
            color: kSecondary,
            fontFamily: AppFonts.pjs600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}