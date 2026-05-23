import 'package:daffy/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../constants/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
    final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final TextInputType keyboardType;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.text, this.prefixIcon,
  });

  static final TextStyle _hintStyle = TextStyle(
    color: Color(0xffA1A1A1),
    fontSize: 14,
    fontFamily: AppFonts.pjs400,
  
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

     
      inputFormatters: keyboardType == TextInputType.emailAddress
          ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
          : null,

     
      onChanged: (value) {
        final trimmed = value.trim();
        if (value != trimmed) {
          controller.value = TextEditingValue(
            text: trimmed,
            selection: TextSelection.collapsed(offset: trimmed.length),
          );
        }
      },

     
      validator: (value) => validator?.call(value?.trim()),

      autovalidateMode: autovalidateMode,
      obscuringCharacter: '●',
      cursorColor: kGrey,

      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color:  Color(0xffE0E0E0), width: 2),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: const BoxConstraints(minHeight: 9, minWidth: 32),
        hintText: hintText,
        hintStyle: _hintStyle,
      ),
    );
  }
}
