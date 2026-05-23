import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 1)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final String checkIn;

  @HiveField(2)
  String? checkOut;

  @HiveField(3)
  final String latitude;

  @HiveField(4)
  final String longitude;

  @HiveField(5)
  final int distributorId;

  @HiveField(6)
  final int routeId;

  @HiveField(7)
  bool isPosted;

  @HiveField(8)
  final String date;

  @HiveField(9)
  final String distributorName;

  @HiveField(10)
  final String routeName;


  @HiveField(11)     
  int? attendanceId;

  AttendanceModel({
    required this.userId,
    required this.checkIn,
    this.checkOut,
    required this.latitude,
    required this.longitude,
    required this.distributorId,
    required this.routeId,
    this.isPosted = false,
    required this.date,
    required this.distributorName,
    required this.routeName,
     this.attendanceId,
  });
}