 import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../widgets/custom_text_widget.dart';

Widget statusBadge(bool isActive) {
    final color = isActive ? kPrimaryColor: kGrey;
    final bg =
        isActive ? const Color(0xffE6FAF5) : const Color(0xffF3F4F6);
    final label = isActive ? 'Active' : 'Inactive';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomTextWidget(
        text: label,
        color: color,
        fontFamily: AppFonts.pjs600,
        fontSize: 12,
      ),
    );
  }