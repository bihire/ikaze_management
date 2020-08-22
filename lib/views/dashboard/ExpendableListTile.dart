import 'package:flutter/material.dart';
import 'package:inventory_controller/models/moneyTransaction.dart';
import './TransactioListTile.dart';

class Expansionpanel extends StatefulWidget {
  final List<MoneyTransactionModel> transactions;
  Expansionpanel({
    Key key,
    @required this.transactions
  }) : super(key: key);

  Expansionpaneltate createState() => Expansionpaneltate();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}

class Expansionpaneltate extends State<Expansionpanel> {
  List<NewItem> items = <NewItem>[
    NewItem(
        false,
        'Header',
        Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Text('data'),
              Text('data'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
              Radio(value: null, groupValue: null, onChanged: null),
              //put the children here
            ])),
        Icon(Icons.image)),
  ];

  Widget List_Criteria;

  Widget build(BuildContext context) {
    List_Criteria = Padding(
      padding: EdgeInsets.all(10.0),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            items[index].isExpanded = !items[index].isExpanded;
          });
        },
        children: items.map((NewItem item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return MyListTile();
            },
            canTapOnHeader: true,
            isExpanded: item.isExpanded,
            body: item.body,
          );
        }).toList(),
      ),
    );

    return Container(
      child: List_Criteria,
    );
  }
}
