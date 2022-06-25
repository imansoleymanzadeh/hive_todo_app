// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Status.done;
      case 1:
        return Status.inProgracess;
      case 2:
        return Status.end;
      case 3:
        return Status.expired;
      default:
        return Status.done;
    }
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    switch (obj) {
      case Status.done:
        writer.writeByte(0);
        break;
      case Status.inProgracess:
        writer.writeByte(1);
        break;
      case Status.end:
        writer.writeByte(2);
        break;
      case Status.expired:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
