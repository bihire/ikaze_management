import 'package:flutter/material.dart';
import 'package:inventory_controller/models/money_transactions.dart';

class MoneyTransactionModelListItem extends StatelessWidget {
  const MoneyTransactionModelListItem({
    Key key,
    @required this.itemIndex,
    @required this.transaction,
  }) : super(key: key);

  final int itemIndex;
  final MoneyTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        title: Text(
          '#${itemIndex + 1}: ${transaction.productId}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${transaction.createdAt}'),
            Text(transaction.unitPrice),
          ],
        ),
        isThreeLine: true,
      ),
      height: 60.0,
    );
  }
}
