import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final Color color;
  final String? fontFamily;
  const SectionCard({
    super.key,
    required this.title,
    required this.color,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text: title,
      color: color,
      fontSize: 12,
      fontFamily: fontFamily ?? AppFonts.pjs600,
    );
  }
}
