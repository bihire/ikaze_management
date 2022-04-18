class MoneyTransactionModel {
  String id;
  String productId;
  String entryType;
  String quantity;
  String unitPrice;
  String paidBy;
  String createdAt;

  MoneyTransactionModel(
      {required this.id,
      required this.productId,
      required this.entryType,
      required this.quantity,
      required this.unitPrice,
      required this.paidBy,
      required this.createdAt});
}
