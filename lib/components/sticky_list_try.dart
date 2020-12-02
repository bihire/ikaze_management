import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      // anchor: 1.0,
      
      // direction: InfiniteListDirection.multi,
      // negChildCount: 0,
      // posChildCount: 10,
      
      // posChildCount: 0,
      
      builder: (BuildContext context, int index) {
        /// Builder requires [InfiniteList] to be returned
        return InfiniteListItem.overlay(
        
          // mainAxisAlignment: HeaderMainAxisAlignment.end,
          // crossAxisAlignment: HeaderCrossAxisAlignment.start,
          
          /// Header builder
          headerBuilder: (BuildContext context) {
            return Container(
              child: Text('data', style: TextStyle(color: Colors.red),),
              ///...
            );
          },
          /// Content builder
          contentBuilder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.black,
              child: Text('data'),

              ///...
            );
          },
        );
      }
    );
  }
}