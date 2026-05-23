import 'package:daffy/constants/app_constants.dart';
import 'package:daffy/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/attendance_model.dart';
import 'models/user_model.dart';
import 'routes/routes.dart';
import 'services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(AttendanceModelAdapter());
  await Hive.openBox<UserModel>(AppConstants.userBox);
  await Hive.openBox<AttendanceModel>(AppConstants.attendanceBox);
  final hiveService = HiveService();
  final user = hiveService.getUserData();
  if (user != null) {
    ApiService.setAuthToken(user.token);
  }
  runApp(Daffy());
}

class Daffy extends StatelessWidget {
  final HiveService _hiveService = HiveService();
  Daffy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daffy',
      initialRoute:
          _hiveService.isLoggedIn() ? AppRoutes.bottomNav : AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
