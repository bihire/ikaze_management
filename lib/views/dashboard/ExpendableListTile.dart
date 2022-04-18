import 'package:flutter/material.dart';
import 'package:inventory_controller/models/moneyTransaction.dart';
import './TransactioListTile.dart';

class Expansionpanel extends StatefulWidget {
      final List<MoneyTransactionModel> transactions;
      Expansionpanel({
        Key? key,
        required this.transactions,
      }) : super(key: key);

      ExpansionListExampleState createState() => ExpansionListExampleState();
    }

    class ExpansionListExampleState extends State<Expansionpanel> {
      late List<bool> openList;

      @override
      void initState() {
        openList = List.filled(widget.transactions.length, false);
        super.initState();
      }

      Widget build(BuildContext context) {
        return Container(
          child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                openList[index] = !openList[index];
              });
            },
            children: getItemList(),
          ),
        ));
      }

      List<ExpansionPanel> getItemList() {
        return widget.transactions
            .asMap()
            .map((index, item) {
              return MapEntry(
                  index,
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return MyListTile(header: item.productId,date: item.createdAt);
                    },
                    canTapOnHeader: true,
                    isExpanded: openList[index],
                    body: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
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
                        ],
                      ),
                    ),
                  ));
            })
            .values
            .toList();
      }
    }