// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceModelAdapter extends TypeAdapter<AttendanceModel> {
  @override
  final int typeId = 1;

  @override
  AttendanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceModel(
      userId: fields[0] as int,
      checkIn: fields[1] as String,
      checkOut: fields[2] as String?,
      latitude: fields[3] as String,
      longitude: fields[4] as String,
      distributorId: fields[5] as int,
      routeId: fields[6] as int,
      isPosted: fields[7] as bool,
      date: fields[8] as String,
      distributorName: fields[9] as String,
      routeName: fields[10] as String,
      attendanceId: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.checkIn)
      ..writeByte(2)
      ..write(obj.checkOut)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.distributorId)
      ..writeByte(6)
      ..write(obj.routeId)
      ..writeByte(7)
      ..write(obj.isPosted)
      ..writeByte(8)
      ..write(obj.date)
      ..writeByte(9)
      ..write(obj.distributorName)
      ..writeByte(10)
      ..write(obj.routeName)
      ..writeByte(11)
      ..write(obj.attendanceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
