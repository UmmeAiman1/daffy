import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/attendance_model.dart';
import 'api_service.dart';
import 'hive_service.dart';
import 'location_service.dart';

class AttendanceService {
  final dio = ApiService.dio;
  final LocationService locationService = LocationService();
  final _hiveService = HiveService();


  Future<void> checkIn(
   
    int userId,
    int distributorId,
    int routeId,
    String distributorName,
    String routeName,
  ) async {
    final position = await locationService.getCurrentLcoation();
    final dateTime = locationService.getCurrentDateTime();
    final date = locationService.getCurrentDate();

    final attendance = AttendanceModel(
      attendanceId: null,
      userId: userId,
      checkIn: dateTime,
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
      distributorId: distributorId,
      routeId: routeId,
      date: date,
      distributorName: distributorName,
      routeName: routeName,
      isPosted: false,
    );

    await _hiveService.saveAttendanceData(attendance);
    
  }


  Future<void> checkOut(AttendanceModel attendance) async {
    final dateTime = locationService.getCurrentDateTime();
    await _hiveService.updateCheckout(attendance, dateTime);
   
  }

 
  Future<void> postAttendance(AttendanceModel attendance) async {
    try {
   
   final checkInResponse =   await dio.post('/attendence/in', data: {
        'in': attendance.checkIn,
        'user_id': attendance.userId,
        'latitude': attendance.latitude,
        'longitude': attendance.longitude,
        'distributor_id': attendance.distributorId,
        'route_id': attendance.routeId,
      });

  final attendanceId = checkInResponse.data['data'][0]['id'];
      if (attendance.checkOut != null) {
    await dio.post('/attendence/out', data: {
      'id': attendanceId,
          'out': attendance.checkOut,
          'user_id': attendance.userId,
          'latitude': attendance.latitude,
          'longitude': attendance.longitude,
          'distributor_id': attendance.distributorId,
          'route_id': attendance.routeId,
        });
     
      }

   attendance.attendanceId = attendanceId;
      attendance.isPosted = true;
      await _hiveService.saveAttendanceData(attendance);
    } on DioException catch (e) {
       debugPrint('DIO ERROR: ${e.response?.statusCode}');
    debugPrint('DIO ERROR DATA: ${e.response?.data}');
    throw e.response?.data['message'] ?? 'Network error';
     
    } catch (e) {
    debugPrint('UNKNOWN ERROR: $e');
    rethrow;
  }
  }
}