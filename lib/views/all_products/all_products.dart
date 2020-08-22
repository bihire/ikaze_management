import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllProductsState();
  }
}

class AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All products'),),
      body: Column(children: <Widget>[
        Text('All products')
      ],),
    );
  }
}
