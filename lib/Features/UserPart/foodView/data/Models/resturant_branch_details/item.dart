class Item {
  String? itemId;
  String? itemName;
  String? itemDescription;
  String? itemImageUrl;
  double? itemPrice;

  Item({
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.itemImageUrl,
    this.itemPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json['itemId'] as String?,
        itemName: json['itemName'] as String?,
        itemDescription: json['itemDescription'] as String?,
        itemImageUrl: json['itemImageUrl'] as String?,
        itemPrice: json['itemPrice'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'itemName': itemName,
        'itemDescription': itemDescription,
        'itemImageUrl': itemImageUrl,
        'itemPrice': itemPrice,
      };
}
