import 'package:daffy/constants/app_colors.dart';
import 'package:daffy/constants/app_fonts.dart';
import 'package:daffy/constants/app_sizes.dart';
import 'package:daffy/controller/login_controller.dart';
import 'package:daffy/views/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: only(context, left: 16, right: 16, top: 24),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xffE0E0E0), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: AppFonts.pjs600,
                  ),
                ),
                SizedBox(height: h(context, 8)),
                CustomTextFieldWidget(
                  prefixIcon: const Icon(Icons.email_outlined, color: kGrey),
                  controller: _loginController.emailController,
                  hintText: 'name@company.com',
                ),
                SizedBox(height: h(context, 16)),

                Text(
                  'Password',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: AppFonts.pjs600,
                  ),
                ),
                SizedBox(height: h(context, 8)),

               
                CustomTextFieldWidget(
                  prefixIcon: const Icon(Icons.lock_outline, color: kGrey),
                  controller: _loginController.passwordController,
                  hintText: 'Enter your password',
                  obscureText: _obscurePassword,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kGrey,
                    ),
                  ),
                ),

                SizedBox(height: h(context, 24)),

                // Button reactive rahega — ye theek hai
                Obx(
                  () => CustomButtonWidget(
                    isLoading: _loginController.isLoading.value,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _loginController.login();
                      }
                    },
                    btnName: 'Login',
                    btnColor: kPrimaryColor,
                    color: kWhite,
                    height: h(context, 56),
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}