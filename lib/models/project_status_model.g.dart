// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusModelAdapter extends TypeAdapter<StatusModel> {
  @override
  final int typeId = 2;

  @override
  StatusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusModel()
      ..done = fields[0] as String?
      ..inProgracess = fields[1] as String?
      ..end = fields[2] as String?
      ..expired = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, StatusModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.done)
      ..writeByte(1)
      ..write(obj.inProgracess)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.expired);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
