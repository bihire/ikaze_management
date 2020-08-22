class MoneyTransactionModel {
  String id;
  String productId;
  String entryType;
  String quantity;
  String unitPrice;
  String paidBy;
  String createdAt;

  MoneyTransactionModel(
      {this.id,
      this.productId,
      this.entryType,
      this.quantity,
      this.unitPrice,
      this.paidBy,
      this.createdAt});
}
