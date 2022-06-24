// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 0;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project()
      ..name = fields[0] as String?
      ..description = fields[1] as String?
      ..projectCreateDateTime = fields[2] as DateTime?
      ..taskList = (fields[3] as List?)?.cast<ProjectTask>()
      ..projectStatus = fields[4] as StatusModel?
      ..projectEndDateTime = fields[5] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.projectCreateDateTime)
      ..writeByte(3)
      ..write(obj.taskList)
      ..writeByte(4)
      ..write(obj.projectStatus)
      ..writeByte(5)
      ..write(obj.projectEndDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
