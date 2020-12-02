import 'package:flutter/material.dart';
import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/models/money_transactions.dart';

class MoneyTransactionModelListItem extends StatefulWidget {
  const MoneyTransactionModelListItem({
    Key key,
    @required this.itemIndex,
    @required this.transaction,
  }) : super(key: key);

  final int itemIndex;
  final MoneyTransactionModel transaction;

  @override
  _MoneyTransactionModelListItemState createState() => _MoneyTransactionModelListItemState();
}

class _MoneyTransactionModelListItemState extends State<MoneyTransactionModelListItem> {
  
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
            onTap: () {
              setState((){
                this._isExpanded = !this._isExpanded;
              });
            },
            child: new Container(
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.blueAccent)
              // ),
              child: new AnimatedContainer(
                child: AnimatedPadding(
                  curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 500),
                        padding: !this._isExpanded? const EdgeInsets.all(0.0) :
                          const EdgeInsets.symmetric( vertical: 18.0) ,
                    child: Container(
                      color: !this._isExpanded ? Colors.white :
                          Colors.grey[100],
                      child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: new Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[   
                              Container(
                                width: 10.0,
                                child: widget.transaction.entryType == 'new'? Icon(
                                  Icons.stop_circle_rounded,
                                  size: 10.0,
                                  color: Colors.green,
                                ): null,
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                          Container(
                                              // color: Colors.green,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 7.0, vertical: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                Container(
                                                  child: Text(
                                                      "${widget.transaction.productId}",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                ),
                                                Container(
                                                  child: Text(Utils.dateToString(widget.transaction.createdAt),
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xFFD9D9D9)),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                )
                                              ]),
                                          ),
                                          Container(
                                              child: Column(children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(right: 7.0),
                                                      child: Text(
                                                        "${widget.transaction.transactionTotal} frw",
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black),
                                                        textAlign: TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('paid by: ${widget.transaction.paidBy}',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xFFD9D9D9)),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                            ),
                                  ],
                                ),
                              ),
                              
                                          
                            ],
                        ),
                          ),
                          !this._isExpanded ? AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                        ) : AnimatedContainer(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "Transaction Id",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "#${widget.transaction.id.toString().padLeft(6, '0')}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "${widget.transaction.quantity} kg",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "Entry Type",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "${widget.transaction.entryType}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "Unit Price",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      "${widget.transaction.unitPrice} frw/kg",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // color: Colors.grey,
                        )
                      ],
                  ),
                    ),
                ),
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    // height: _bodyHeight,
              // color: Colors.red,
              ),
            ),
          );
  }
}
