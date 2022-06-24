// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proeject_task_modle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectTaskAdapter extends TypeAdapter<ProjectTask> {
  @override
  final int typeId = 1;

  @override
  ProjectTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectTask()
      ..taskName = fields[0] as String?
      ..taskDescription = fields[1] as String?
      ..taskStartDateTime = fields[2] as DateTime?
      ..taskEndDateTime = fields[3] as DateTime?
      ..taskMode = fields[4] as StatusModel?;
  }

  @override
  void write(BinaryWriter writer, ProjectTask obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.taskDescription)
      ..writeByte(2)
      ..write(obj.taskStartDateTime)
      ..writeByte(3)
      ..write(obj.taskEndDateTime)
      ..writeByte(4)
      ..write(obj.taskMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
