

import 'package:daffy/models/user_model.dart';
import 'package:daffy/services/hive_service.dart';
import 'package:daffy/services/login_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginService _loginService = LoginService();
  final HiveService _hiveService = HiveService();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxBool isPasswordVisible = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      final loggedIn = await _loginService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      await _hiveService.saveUserData(loggedIn);
    
      user.value = loggedIn;
      Get.offAllNamed('/bottom-nav');
    } catch (e, stackTrace) {          
    debugPrint('LOGIN ERROR: $e');
    debugPrint('STACK: $stackTrace'); 
    final error = e.toString().replaceFirst('Exception: ', '');
    errorMessage.value = error;
    Get.snackbar(
      'Login Failed',
      error,
      snackPosition: SnackPosition.BOTTOM,
    );
  } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async{
    await _hiveService.deleteUserData();
    user.value = null;
    Get.offAllNamed('/login');
  }


  void loadUserData() {
    user.value = _hiveService.getUserData();

  }

   @override
     void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
}
}
