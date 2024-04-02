class OrdersCardModel {
  final String title, price, id, img, date;
  bool success;
  OrdersCardModel(
      {required this.title,
      required this.price,
      required this.id,
      required this.img,
      required this.date,
      required this.success});
}
