// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtraAdapter extends TypeAdapter<Extra> {
  @override
  final int typeId = 3;

  @override
  Extra read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Extra(
      name: fields[0] as String?,
      price: fields[1] as num?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Extra obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
