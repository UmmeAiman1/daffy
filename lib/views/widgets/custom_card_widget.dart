import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart' show AppFonts;
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final double? fontsize;
  final double? sfontsize;
  final String? subtitle;
  final String image;
  final double height;
  final double? width;
  final Color textColor;
  final Color? subtitleColor;
  final IconData? icon;

  const CustomCardWidget({
    super.key,
    required this.title,
    this.fontsize,
    required this.image,
    required this.height,
    this.width,
    required this.textColor,
    this.icon,
    this.subtitle,
    this.subtitleColor, this.sfontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: kWhite,
        border: Border.all(color: const Color(0xffE0E0E0), width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image(image: AssetImage(image), height: 40, width: 40),
            SizedBox(width: 12),
            subtitle != null
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: title,
                      color: textColor,
                      fontSize: fontsize ?? 12,
                      fontFamily: AppFonts.pjs600,
                    ),
                    SizedBox(height: 4),
                    CustomTextWidget(
                      text: subtitle ?? 'N/A',
                      color: subtitleColor ?? Colors.transparent,
                      fontSize: sfontsize?? 14,
                      fontFamily: AppFonts.inter700,
                    
                    ),
                  ],
                )
                : CustomTextWidget(text: title, color: textColor),
            icon != null ? Icon(icon, color: textColor) : Container(),
          ],
        ),
      ),
    );
  }
}
