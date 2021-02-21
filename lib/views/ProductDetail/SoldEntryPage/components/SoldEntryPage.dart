import 'package:flutter/material.dart';

import 'package:inventory_controller/components/section_tilte.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/components/LastTransactionCard.dart';
import 'package:inventory_controller/views/dashboard/transactionTable.dart';

class SoldEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        LastTransactionCard(),
        SectionTitle(title: 'Supply History',),
        
      ],
    );
  }
}
