import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

Widget donutChart(
  int visited,
  int completed,
  int pendingShops,
  int totalShops,
  int totalDeliveries,
) {
  final remaining =
      (totalShops - completed - pendingShops).clamp(0, totalShops).toDouble();

  return Stack(
    alignment: Alignment.center,
    children: [
      PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 55,
          startDegreeOffset: -90,

          sections: [
            PieChartSectionData(
              value: totalDeliveries.toDouble(),
              color: const Color(0xFF07BFA6),
              radius: 12,
              showTitle: false,
            ),
            PieChartSectionData(
              value: completed.toDouble(),
              color: kSecondary,
              radius: 12,
              showTitle: false,
            ),
            PieChartSectionData(
              value: pendingShops.toDouble(),
              color: kOrange,
              radius: 12,
              showTitle: false,
            ),
            PieChartSectionData(
              value: remaining,
              color: const Color(0xFFF0F1F3),
              radius: 12,
              showTitle: false,
            ),
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(
            text: 'TOTAL SHOPS',

            fontFamily: AppFonts.pjs400,
            fontSize: 9,
            color: kGrey,
            letterSpacing: 0.5,
          ),
          const SizedBox(height: 2),
          CustomTextWidget(
            text: '25/$totalShops',

            fontFamily: AppFonts.pjs700,
            fontSize: 18,
            color: kSecondary,
          ),
        ],
      ),
    ],
  );
}
