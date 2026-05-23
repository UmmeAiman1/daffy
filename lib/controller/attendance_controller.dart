import 'package:get/get.dart';

import '../models/attendance_model.dart';
import '../models/distributor_model.dart';
import '../models/route_model.dart';
import '../services/attendance_service.dart';
import '../services/hive_service.dart';

class AttendanceController extends GetxController {
  final AttendanceService _attendanceService = AttendanceService();
  final HiveService _hiveService = HiveService();

  final isLoading = false.obs;
  final isCheckingIn = false.obs;
  final errorMessage = ''.obs;
  final isCheckedIn = false.obs;

  final attendances = <AttendanceModel>[].obs;
  final currentAttendance = Rxn<AttendanceModel>();

  @override
  void onInit() {
    super.onInit();
    loadAttendances();
    checkCurrentStatus();
  }

  void loadAttendances() {
    attendances.value = _hiveService.getAttendanceData();
  }

  void checkCurrentStatus() {
    final records = _hiveService.getAttendanceData();
    if (records.isNotEmpty) {
      final last = records.last;
      if (last.checkOut == null) {
        isCheckedIn.value = true;
        currentAttendance.value = last;
      }
    }
  }

  
  Future<void> checkIn({
    required int userId,
    required Distributor distributor,
    required Route route,
  }) async {
    try {
      isCheckingIn.value = true;
      errorMessage.value = '';

      await _attendanceService.checkIn(
        userId,
        distributor.id!,
        route.id!,
        distributor.distributorName!,
        route.routeName!,
      );

      isCheckedIn.value = true;
      loadAttendances();
      currentAttendance.value = _hiveService.getAttendanceData().last;

      Get.snackbar('Success', 'Checked in successfully!');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      isCheckingIn.value = false;
    }
  }


  Future<void> checkOut() async {
    if (currentAttendance.value == null) return;

    try {
      isCheckingIn.value = true;
      errorMessage.value = '';

      await _attendanceService.checkOut(currentAttendance.value!);

      isCheckedIn.value = false;
      currentAttendance.value = null;
      loadAttendances();

      Get.snackbar('Success', 'Checked out successfully!');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      isCheckingIn.value = false;
    }
  }

  Future<void> postAttendance(AttendanceModel attendance) async {
    try {
      isLoading.value = true;
      await _attendanceService.postAttendance(attendance);
      loadAttendances();
      Get.snackbar('Success', 'Attendance posted!');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
