class RidePricesModel {
  double? ridePrice;
  double? rideXPrice;

  RidePricesModel({this.ridePrice, this.rideXPrice});

  factory RidePricesModel.fromJson(Map<String, dynamic> json) {
    return RidePricesModel(
      ridePrice: json['ridePrice'] as double?,
      rideXPrice: json['rideXPrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'ridePrice': ridePrice,
        'rideXPrice': rideXPrice,
      };
}
