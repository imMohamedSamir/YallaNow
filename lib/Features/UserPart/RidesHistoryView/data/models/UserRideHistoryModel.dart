class UserRideHistoryModel {
  String? numberId;
  String? userName;
  String? date;
  String? from;
  String? to;
  String? status;
  String? payment;
  String? driverName;

  String? price;

  UserRideHistoryModel({
    this.numberId,
    this.userName,
    this.driverName,
    this.date,
    this.from,
    this.to,
    this.status,
    this.payment,
    this.price,
  });

  factory UserRideHistoryModel.fromJson(Map<String, dynamic> json) =>
      UserRideHistoryModel(
        numberId: json['numberID'] as String?,
        userName: json['userName'] as String?,
        driverName: json['driverName'] as String?,
        date: json['date'] as String?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        status: json['status'] as String?,
        payment: json['payment'] as String?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'numberID': numberId,
        'userName': userName,
        'from': from,
        'to': to,
        'status': status,
        'payment': payment,
        'price': price,
      };
}
