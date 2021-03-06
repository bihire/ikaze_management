import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';

class CommentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ConstrainedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                    // padding: EdgeInsets.all(7),
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                      "assets/images/tech.jpeg"),
                                ))),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 40,
                            maxWidth: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text(
                            'bihire • 3 hours',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                          'The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero'),
                    )
                  ],
                ),
              ))
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Color(0xFFD9D9D9),
                        height: 36,
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red
                  ),
                  child: Text('9', style: TextStyle(color: primaryLightColor, fontSize: 9),),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Divider(
                        color: Color(0xFFD9D9D9),
                        height: 36,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
