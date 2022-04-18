import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/approveDialog/approve_dialogue.dart';
import 'package:inventory_controller/components/transaction_item.dart';

class NewRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGreyColor,
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Column(
        children: [
          RequestCard(),
          RequestCard(),
        ],
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
          children: [
            Container(
              width: width,
              // color: lightGreyColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text('Manager request',
                          style: TextStyle(fontSize: 14))),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      
                      text: TextSpan(
                        text: 'At ',
                        style: TextStyle(fontSize: 12, color: darkColor),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Ikaze Shop',
                              style: TextStyle(fontWeight: FontWeight.bold, color: hardGreyColor,
                                  fontSize: 16
                              )),
                        ],
                      ),
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: hardGreyColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Deny Request')),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ApproveDialogue(
                                    child: TransactionDeleteDialogue(id: 1),
                                  ));
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: hardGreyColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text('Accept')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
