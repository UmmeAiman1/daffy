import 'package:daffy/controller/attendance_controller.dart';
import 'package:daffy/controller/home_controller.dart';
import 'package:daffy/controller/login_controller.dart';
import 'package:daffy/views/screens/bottom_nav_bar.dart';
import 'package:daffy/views/screens/home_screen.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_bar_controller.dart';
import '../views/screens/history_screen.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/profile_screen.dart';


class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String bottomNav = '/bottom-nav';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String history = '/history';

  // Routes list
  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: bottomNav,
      page: () =>  BottomNavBar(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => BottomNavController());
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => AttendanceController());
      }),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => AttendanceController());
      }),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: history,
      page: () => HistoryScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AttendanceController());
      }),
    ),
  ];
}