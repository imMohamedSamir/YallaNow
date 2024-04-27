// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectedItemsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedItemsModelAdapter extends TypeAdapter<SelectedItemsModel> {
  @override
  final int typeId = 1;

  @override
  SelectedItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedItemsModel(
      name: fields[0] as String,
      price: fields[1] as String,
      img: fields[2] as String,
      quantity: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedItemsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.img)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
