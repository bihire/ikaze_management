import 'package:intl/intl.dart';

class ProductModel {
  int id;
  String productName;
  int unitPrice;
  String unitQuantity;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  String get createdAtFormatted =>
      DateFormat.yMMMd().add_Hm().format(createdAt);
  String get updatedAtFormatted =>
      DateFormat.yMMMd().add_Hm().format(updatedAt);

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productName = json['product_name'],
        unitPrice = int.parse(json['unit_price']),
        unitQuantity = json['unit_quantity'],
        userId = json['user_id'],
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);
}

class ProductInfoModel {
  int productId;
  String productName;
  int unitPrice;
  ProductInfoModel(this.productId, this.productName, this.unitPrice);
}
