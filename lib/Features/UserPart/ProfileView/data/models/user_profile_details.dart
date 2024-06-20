import 'package:hive/hive.dart';
part 'user_profile_details.g.dart';

@HiveType(typeId: 0)
class UserProfileDetails extends HiveObject {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  dynamic phoneNumber;
  @HiveField(4)
  String? id;
  @HiveField(5)
  String? userName;
  @HiveField(6)
  dynamic restaurantsOrders;
  @HiveField(7)
  dynamic addresses;
  @HiveField(8)
  double? wallet;

  UserProfileDetails(
      {this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.id,
      this.userName,
      this.restaurantsOrders,
      this.addresses,
      this.wallet});

  factory UserProfileDetails.fromJson(Map<String, dynamic> json) {
    return UserProfileDetails(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as dynamic,
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      restaurantsOrders: json['restaurantsOrders'] as dynamic,
      addresses: json['addresses'] as dynamic,
      wallet: json['wallet'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'id': id,
        'userName': userName,
        'restaurantsOrders': restaurantsOrders,
        'addresses': addresses,
        'wallet': wallet
      };
}
