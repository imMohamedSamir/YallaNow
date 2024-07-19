class RideHistory {
  String? numberId;
  String? userName;
  String? from;
  String? to;
  String? status;
  String? payment;
  int? totalKillos;
  String? price;

  RideHistory({
    this.numberId,
    this.userName,
    this.from,
    this.to,
    this.status,
    this.payment,
    this.totalKillos,
    this.price,
  });

  factory RideHistory.fromJson(Map<String, dynamic> json) => RideHistory(
        numberId: json['numberID'] as String?,
        userName: json['userName'] as String?,
        from: json['from'] as String?,
        to: json['to'] as String?,
        status: json['status'] as String?,
        payment: json['payment'] as String?,
        totalKillos: json['totalKillos'] as int?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'numberID': numberId,
        'userName': userName,
        'from': from,
        'to': to,
        'status': status,
        'payment': payment,
        'totalKillos': totalKillos,
        'price': price,
      };
}
