import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_images.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/views/screens/widgets/login_form.dart';
import 'package:daffy/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
       resizeToAvoidBottomInset: false,
        backgroundColor: kOffwhite,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            children: [
              Padding(
                padding: only(context, top: 150, right: 24, left: 24),
                child: Image.asset(Assets.imagesLogo, height: h(context, 80),),
              ),
              SizedBox(height: h(context, 15)),
              Center(
                child: CustomTextWidget(
                  text: 'Welcome Back',
                  color: kSecondary,
                  fontSize: 24,
                  fontFamily: AppFonts.pjs700,
                ),
              ),
              SizedBox(height: h(context, 8)),
              CustomTextWidget(
                text: 'Login with your comapany credentials',
                color: kGrey,
                fontSize: 14,
                fontFamily: AppFonts.pjs400,
              ),
              SizedBox(height: h(context, 24)),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
