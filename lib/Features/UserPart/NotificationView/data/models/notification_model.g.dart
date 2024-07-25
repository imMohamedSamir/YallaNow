// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedNotificationModelAdapter
    extends TypeAdapter<SavedNotificationModel> {
  @override
  final int typeId = 5;

  @override
  SavedNotificationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedNotificationModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
      isRead: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SavedNotificationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.isRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedNotificationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
