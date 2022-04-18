import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 20.0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                
                child: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
              ),
          //     Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //       decoration: BoxDecoration(
          //           border: Border.all(color: light1ShadeColor),
          //           borderRadius: BorderRadius.circular(5)),
          //       child: Text('Supplies History'),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
