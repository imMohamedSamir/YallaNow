// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripCardModelAdapter extends TypeAdapter<TripCardModel> {
  @override
  final int typeId = 7;

  @override
  TripCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripCardModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      imageUrl: fields[2] as String?,
      description: fields[3] as String?,
      destniation: fields[4] as String?,
      price: fields[5] as int?,
      currency: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TripCardModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.destniation)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
