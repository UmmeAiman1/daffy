import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String token;

  @HiveField(4)
  final String? image;

  @HiveField(5)
  final String? phone;

  @HiveField(6)
  final String? cellPhone;

  @HiveField(7)
  final String? empId;

  @HiveField(8)
  final String? tsoCode;

  @HiveField(9)
  final String? designation;

  @HiveField(10)
  final String? department;

  @HiveField(11)
  final String? address;

  @HiveField(12)
  final String? cnic;

  @HiveField(13)
  final String? companyName;

  @HiveField(14)
  final String? dateOfJoin;

  @HiveField(15)
  final String? dateOfLeaving;

  @HiveField(16)
  final String? state;

  @HiveField(17)
  final String? country;

  @HiveField(18)
  final String? map;

  @HiveField(19)
  final int? distributorId;

  @HiveField(20)
  final int userType;

  @HiveField(21)
  final int status;

  @HiveField(22)
  final String? username;

  // Attendance fields
  @HiveField(23)
  final int? attendanceId;

  @HiveField(24)
  final String? checkIn;

  @HiveField(25)
  final String? checkOut;

  @HiveField(26)
  final String? latitudeIn;

  @HiveField(27)
  final String? longitudeIn;

  @HiveField(28)
  final String? attendanceDate;

  @HiveField(29)
  final int? routeId;
  
  @HiveField(30)
final String? city;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.userType,
    required this.status,
    this.image,
    this.phone,
    this.cellPhone,
    this.empId,
    this.tsoCode,
    this.designation,
    this.department,
    this.address,
    this.cnic,
    this.companyName,
    this.dateOfJoin,
    this.dateOfLeaving,
    this.state,
    this.country,
    this.map,
    this.distributorId,
    this.username,
    this.attendanceId,
    this.checkIn,
    this.checkOut,
    this.latitudeIn,
    this.longitudeIn,
    this.attendanceDate,
    this.routeId,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final tso = data['tso'];
    final attendance = data['attendence'];

    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      token: data['token'],
      userType: data['user_type'],
      status: data['status'],
      image: data['image'],
      username: data['username'],
      phone: tso['phone']?.toString(),
      cellPhone: tso['cell_phone']?.toString(),
      empId: tso['emp_id']?.toString(),
      tsoCode: tso['tso_code']?.toString(),
      designation: tso['designation']?['name']?.toString(),
      department: tso['department']?['name']?.toString(),
      address: tso['address']?.toString(),
      cnic: tso['cnic']?.toString(),
      companyName: tso['company_name']?.toString(),
      dateOfJoin: tso['date_of_join']?.toString(),
      dateOfLeaving: tso['date_of_leaving']?.toString(),
      state: tso['state']?.toString(),
      country: tso['country']?.toString(),
      map: tso['map']?.toString(),
      distributorId: tso['distributor_id'],
      attendanceId: attendance?['id'],
      checkIn: attendance?['in'],
      checkOut: attendance?['out'],
      latitudeIn: attendance?['latitude_in'],
      longitudeIn: attendance?['longitude_in'],
      attendanceDate: attendance?['date'],
      routeId: attendance?['route_id'],
      city: tso['cities']?['name']?.toString(),
    );
  }
}