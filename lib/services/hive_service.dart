import 'package:daffy/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';
import '../models/attendance_model.dart';

class HiveService {

  Future<void> saveUserData(UserModel user) async {
    final userBox = Hive.box<UserModel>(AppConstants.userBox);
    await userBox.put('user', user);
  }

  UserModel? getUserData() {
    final userBox = Hive.box<UserModel>(AppConstants.userBox);
    return userBox.get('user');
  }

  Future<void> deleteUserData() async {
    final userBox = Hive.box<UserModel>(AppConstants.userBox);
    await userBox.delete('user');
  }

  bool isLoggedIn(){
    final user = getUserData();
    return user != null && user.token.isNotEmpty;
  }

 Future<void> saveAttendanceData(AttendanceModel attendance) async {
  final attendanceBox = Hive.box<AttendanceModel>(AppConstants.attendanceBox);

  if (attendance.isInBox) {
    await attendance.save();
  } else {
    await attendanceBox.add(attendance);
  }
}
  List<AttendanceModel> getAttendanceData() {
    final attendanceBox = Hive.box<AttendanceModel>(AppConstants.attendanceBox);
    return attendanceBox.values.toList();
  }
   Future<void> updateCheckout(AttendanceModel attendance, String checkOut) async {
    attendance.checkOut = checkOut;
    await attendance.save();
  }
}
