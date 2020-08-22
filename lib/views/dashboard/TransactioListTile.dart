import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Container(
            padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            child: new Row(
              children: <Widget>[
                Container(
            width: 40,
            height: 40,

            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF559F),
                      Color(0xFFCF5CCF),
                      Color(0xFFFF57AC),
                      Color(0xFFFF6D91),
                      Color(0xFFFF8D7E),
                      Color(0xFFB6BAA6),
                    ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Icon(
                Icons.assignment_returned,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
          Flexible(
            child: new Container(
              padding: new EdgeInsets.only(right: 13.0),
              child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Text(
                      "Travetine",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      'mar 07:00',
                      style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF9E9E9E)
                      ),
                    ),
                  ],
                ),
              ]
            ),
            ),
          ),
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Row(
                  children: <Widget>[

                    new Text(
                      '14,000.00',
                      style: new TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF212121)
                      ),
                    ),
                    new Text(
                      ' rwf',
                      style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF9E9E9E)
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      'Paid using:  ',
                      style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF9E9E9E)
                      ),
                    ),
                    new Text(
                      'mtn ',
                      style: new TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF9E9E9E)
                      ),
                    ),

                  ],
                ),
              ]
            )
          ),
            ],
          ),
        ),

        
      ],
    );
  }
}
