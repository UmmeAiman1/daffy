 import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

Widget data(Color color, String label, int value) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: AppFonts.pjs400,
              fontSize: 13,
              color: Color(0xff4A5565),
            ),
          ),
        ),
        Text(
          '$value',
          style: TextStyle(
            fontFamily: AppFonts.pjs700,
            fontSize: 14,
            color: kSecondary,
          ),
        ),
      ],
    );
  }
