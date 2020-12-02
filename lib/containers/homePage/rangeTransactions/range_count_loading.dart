import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class RangeCountLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SkeletonAnimation(
                child: Container(
                  width: width * 2/3,
                  height: 17.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SkeletonAnimation(
                child: Container(
                  width: width - 16,
                  height: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 13.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SkeletonAnimation(
                child: Container(
                  width: width - 16,
                  height: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                ),
              ),
              
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}