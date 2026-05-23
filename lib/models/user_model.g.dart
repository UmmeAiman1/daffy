// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      token: fields[3] as String,
      userType: fields[20] as int,
      status: fields[21] as int,
      image: fields[4] as String?,
      phone: fields[5] as String?,
      cellPhone: fields[6] as String?,
      empId: fields[7] as String?,
      tsoCode: fields[8] as String?,
      designation: fields[9] as String?,
      department: fields[10] as String?,
      address: fields[11] as String?,
      cnic: fields[12] as String?,
      companyName: fields[13] as String?,
      dateOfJoin: fields[14] as String?,
      dateOfLeaving: fields[15] as String?,
      state: fields[16] as String?,
      country: fields[17] as String?,
      map: fields[18] as String?,
      distributorId: fields[19] as int?,
      username: fields[22] as String?,
      attendanceId: fields[23] as int?,
      checkIn: fields[24] as String?,
      checkOut: fields[25] as String?,
      latitudeIn: fields[26] as String?,
      longitudeIn: fields[27] as String?,
      attendanceDate: fields[28] as String?,
      routeId: fields[29] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.cellPhone)
      ..writeByte(7)
      ..write(obj.empId)
      ..writeByte(8)
      ..write(obj.tsoCode)
      ..writeByte(9)
      ..write(obj.designation)
      ..writeByte(10)
      ..write(obj.department)
      ..writeByte(11)
      ..write(obj.address)
      ..writeByte(12)
      ..write(obj.cnic)
      ..writeByte(13)
      ..write(obj.companyName)
      ..writeByte(14)
      ..write(obj.dateOfJoin)
      ..writeByte(15)
      ..write(obj.dateOfLeaving)
      ..writeByte(16)
      ..write(obj.state)
      ..writeByte(17)
      ..write(obj.country)
      ..writeByte(18)
      ..write(obj.map)
      ..writeByte(19)
      ..write(obj.distributorId)
      ..writeByte(20)
      ..write(obj.userType)
      ..writeByte(21)
      ..write(obj.status)
      ..writeByte(22)
      ..write(obj.username)
      ..writeByte(23)
      ..write(obj.attendanceId)
      ..writeByte(24)
      ..write(obj.checkIn)
      ..writeByte(25)
      ..write(obj.checkOut)
      ..writeByte(26)
      ..write(obj.latitudeIn)
      ..writeByte(27)
      ..write(obj.longitudeIn)
      ..writeByte(28)
      ..write(obj.attendanceDate)
      ..writeByte(29)
      ..write(obj.routeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
