import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/rounded_input_field.dart';
import 'package:inventory_controller/utils/debounce.dart';

class AddShopDialogue extends StatefulWidget {
  final int id;
  AddShopDialogue({required this.id});

  @override
  _AddShopDialogueState createState() => _AddShopDialogueState();
}

class _AddShopDialogueState extends State<AddShopDialogue> {
  // final RequestTransactionDeleteBloc deleteBloc =
  //     RequestTransactionDeleteBloc();
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  void dispose() {
    // deleteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 40,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: lightGreyColor, shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      'Create a Shop',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              child: Row(
                children: [
                  Expanded(
                    child: RoundedInputField(
                      icon: Icons.shop,
                      error: null,
                      hintText: "Shop Name",
                      iconColor: hardGreyColor,
                      backgroundColor: lightGreyColor,
                      onChanged: (value) {
                        // setState(() {
                        //   user_name = value;
                        //   isButtonClickable = _getBtnState();
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                          child: Container(
                            child: Text('Cancel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
