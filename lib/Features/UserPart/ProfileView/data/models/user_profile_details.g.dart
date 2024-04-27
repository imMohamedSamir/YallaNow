// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileDetailsAdapter extends TypeAdapter<UserProfileDetails> {
  @override
  final int typeId = 0;

  @override
  UserProfileDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileDetails(
      email: fields[0] as String?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      phoneNumber: fields[3] as dynamic,
      id: fields[4] as String?,
      userName: fields[5] as String?,
      restaurantsOrders: fields[6] as dynamic,
      addresses: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.restaurantsOrders)
      ..writeByte(7)
      ..write(obj.addresses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
