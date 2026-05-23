import 'package:daffy/constants/app_colors.dart';


import 'package:daffy/controller/home_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';
import 'donut_chart.dart';
import 'online_badge.dart';
import 'tabs.dart';

class StatsCard extends StatelessWidget {
  final int totalDeliveries;
  final int completed;
  final int pendingShops;
  final int totalShops;

  StatsCard({
    super.key,
    this.totalDeliveries = 25,
    this.completed = 18,
    this.pendingShops = 12,
    this.totalShops = 50,
  });

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final visited = totalDeliveries + completed;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffE0E0E0), width: 1),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -40,
              child: Container(
                width: 130,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEFF6FF),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: tabs(controller)),
                      const SizedBox(width: 8),
                      onlineBadge(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: donutChart(
                          visited,
                          completed,
                          pendingShops,
                          totalShops,
                          totalDeliveries,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            data(
                              const Color(0xFF00BFA5),
                              'Total Deliveries',
                              totalDeliveries,
                            ),
                            const SizedBox(height: 12),
                            data(kSecondary, 'Completed', completed),
                            const SizedBox(height: 12),
                            data(kOrange, 'Pending Shops', pendingShops),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


 

 
}
