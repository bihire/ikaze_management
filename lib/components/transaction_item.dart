import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/requestTransactionDelete/request_transaction_delete_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/common/date_formater.dart';
import 'package:inventory_controller/components/approveDialog/approve_dialogue.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/settingDrawer/settings_drawer.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.itemIndex,
    required this.transaction,
  }) : super(key: key);

  final int itemIndex;
  final MoneyTransactionModel transaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blueAccent)
      // ),
      child: new AnimatedContainer(
        child: AnimatedPadding(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          padding: !this._isExpanded
              ? const EdgeInsets.all(0.0)
              : const EdgeInsets.symmetric(vertical: 18.0),
          child: Container(
            color: !this._isExpanded ? Colors.white : Colors.grey[100],
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      this._isExpanded = !this._isExpanded;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: new Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          child: widget.transaction.entryType == 'new'
                              ? Icon(
                                  Icons.stop_circle_rounded,
                                  size: 10.0,
                                  color: Colors.green,
                                )
                              : null,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "${widget.transaction.product.productName}",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          Utils.dateToString(
                                              widget.transaction.createdAt),
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 7.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'paid by: ${widget.transaction.paidBy}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFD9D9D9)),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ]),
                                    Container(
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 25.0,
                                        color: lightShadeColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ExpandedSection(
                    expand: _isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    
                                    padding: EdgeInsets.only(right: 7.0, top: 7),
                                    child: Text(
                                      "Added by: B Boris",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          color: hardGreyColor),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(right: 7.0),
                                  //   child: Text(
                                  //     "${widget.transaction.unitPrice} frw/kg",
                                  //     style: TextStyle(
                                  //         fontSize: 16.0,
                                  //         fontWeight: FontWeight.w400,
                                  //         color: Colors.black),
                                  //     textAlign: TextAlign.right,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: hardGreyColor),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text('edit')),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => ApproveDialogue(
                                                child: TransactionDeleteDialogue(
                                                    id: widget.transaction.id),
                                              ));
                                    },
                                    child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 10, 0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: hardGreyColor),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text('delete')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    ),),
                // !this._isExpanded
                //     ? AnimatedContainer(
                //         curve: Curves.easeInOut,
                //         duration: const Duration(milliseconds: 300),
                //       )
                //     : AnimatedContainer(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 10.0, vertical: 12.0),
                //         curve: Curves.easeInOut,
                //         duration: const Duration(milliseconds: 500),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "Transaction Id",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "#${widget.transaction.id.toString().padLeft(6, '0')}",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w600,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "Quantity",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "${widget.transaction.quantity} kg",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "Entry Type",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "${widget.transaction.entryType}",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "Unit Price",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(right: 7.0),
                //                   child: Text(
                //                     "${widget.transaction.unitPrice} frw/kg",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: Colors.black),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Padding(
                                  
                //                   padding: EdgeInsets.only(right: 7.0, top: 7),
                //                   child: Text(
                //                     "Added by: B Boris",
                //                     style: TextStyle(
                //                         fontSize: 16.0,
                //                         fontWeight: FontWeight.w400,
                //                         color: hardGreyColor),
                //                     textAlign: TextAlign.right,
                //                   ),
                //                 ),
                //                 // Padding(
                //                 //   padding: EdgeInsets.only(right: 7.0),
                //                 //   child: Text(
                //                 //     "${widget.transaction.unitPrice} frw/kg",
                //                 //     style: TextStyle(
                //                 //         fontSize: 16.0,
                //                 //         fontWeight: FontWeight.w400,
                //                 //         color: Colors.black),
                //                 //     textAlign: TextAlign.right,
                //                 //   ),
                //                 // ),
                //               ],
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.end,
                //               children: [
                //                 Container(
                //                     margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                //                     padding: EdgeInsets.symmetric(
                //                         horizontal: 10, vertical: 5),
                //                     decoration: BoxDecoration(
                //                         border:
                //                             Border.all(color: hardGreyColor),
                //                         borderRadius:
                //                             BorderRadius.circular(20)),
                //                     child: Text('edit')),
                //                 InkWell(
                //                   onTap: () {
                //                     showDialog(
                //                         context: context,
                //                         builder: (_) => ApproveDialogue(
                //                               child: TransactionDeleteDialogue(
                //                                   id: widget.transaction.id),
                //                             ));
                //                   },
                //                   child: Container(
                //                       margin:
                //                           EdgeInsets.fromLTRB(10, 20, 10, 0),
                //                       padding: EdgeInsets.symmetric(
                //                           horizontal: 10, vertical: 5),
                //                       decoration: BoxDecoration(
                //                           border:
                //                               Border.all(color: hardGreyColor),
                //                           borderRadius:
                //                               BorderRadius.circular(20)),
                //                       child: Text('delete')),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //         // color: Colors.grey,
                //       )
              ],
            ),
          ),
        ),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        // height: _bodyHeight,
        // color: Colors.red,
      ),
    );
  }
}

class TransactionDeleteDialogue extends StatefulWidget {
  final int id;
  TransactionDeleteDialogue({required this.id});

  @override
  _TransactionDeleteDialogueState createState() =>
      _TransactionDeleteDialogueState();
}

class _TransactionDeleteDialogueState extends State<TransactionDeleteDialogue> {
  final RequestTransactionDeleteBloc deleteBloc =
      RequestTransactionDeleteBloc();
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  void dispose() {
    deleteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<RequestTransactionDeleteBloc,
        RequestTransactionDeleteState>(
      bloc: deleteBloc,
      builder: (context, state) {
        return Container(
          width: width - 40,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: state is RequestTransactionDeleteLoading
                ? Container(height: 100, child: LoadingIndicator())
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: Text(
                            "Delete transaction with id #${widget.id.toString().padLeft(6, '0')}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: InkWell(
                                  child: Container(
                                    child: Text('Cancel',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )),
                          )),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              _debouncer.run(() => deleteBloc.add(RequestDelete(widget.id, context)));
                            },
                            child: Container(
                                color: Colors.redAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: InkWell(
                                  child: Container(
                                    child: Text(
                                      'Delete',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: primaryLightColor),
                                    ),
                                  ),
                                )),
                          ))
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
