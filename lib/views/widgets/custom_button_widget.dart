import 'package:flutter/material.dart';


import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isLoading;
  final String btnName;
  final Color? btnColor;
  final Color? color;
  final Color? borderColor;
  final GestureTapCallback? onPressed;
  final String? icon;
  final double? height;
  final double? width;
  final double? fontSize;

  const CustomButtonWidget({
    super.key,
    required this.btnName,
    this.color,
    this.borderColor,
    this.onPressed,
    this.icon,
    this.height,
    this.width,
    this.btnColor,
    this.fontSize,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(12),
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
          ),
          child: Center(
            child:
                isLoading
                    ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                    : icon != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(icon!, height: 25, width: 25),
                        const SizedBox(width: 10),
                        CustomTextWidget(
                          text: btnName,
                          color: color!,
                          fontSize: fontSize ?? 20,

                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                    : CustomTextWidget(
                      text: btnName,
                      color: color!,
                      fontSize: fontSize ?? 20,
                      fontWeight: FontWeight.w500,
                    ),
          ),
        ),
      ),
    );
  }
}
