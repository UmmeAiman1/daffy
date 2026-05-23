 import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_fonts.dart';

Widget onlineBadge() {
    return Container(
      height: 27,
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x1A008236),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF008236), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFF008236),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Center(
            child: CustomTextWidget(
             text:  'Online',
                     
                fontFamily: AppFonts.pjs600,
                fontSize: 11,
                color: const Color(0xFF008236),
              ),
          ),
   
        ],
      ),
    );
  }