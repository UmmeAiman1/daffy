import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/controller/home_controller.dart';
import 'package:daffy/views/screens/widgets/distributor_card.dart';
import 'package:daffy/views/screens/widgets/router_card.dart';

import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/app_sizes.dart';
import 'widgets/attendance_card.dart';
import 'widgets/stats_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('MMM d, yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: kOffwhite,
      drawer: Drawer(),
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 0.2,
        backgroundColor: kOffwhite,
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Dashboard',
          color: kSecondary,
          fontFamily: AppFonts.pjs700,
          fontSize: 18,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: kSecondary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: all(context, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final userName = controller.user.value!.name;
                return CustomTextWidget(
                  text: 'Good Morning, $userName',
                  color: kSecondary,
                  fontSize: 24,
                  fontFamily: AppFonts.pjs700,
                );
              }),
              SizedBox(height: h(context, 8)),
              CustomTextWidget(
                text: 'Today, $today',
                color: kGrey,
                fontSize: 14,
                fontFamily: AppFonts.pjs400,
              ),
              SizedBox(height: h(context, 24)),
              StatsCard(),
              SizedBox(height: h(context, 24)),
              AttendanceCard(),
              SizedBox(height: h(context, 24)),
              DistributorCard(),
              SizedBox(height: h(context, 24)),
              RouterCard(),
            ],
          ),
        ),
      ),
    );
  }
}
