import 'package:flutter/material.dart';
import 'package:inventory_controller/views/PopupMenuButtonPage/PopupMenuButtonPage.dart';
import 'package:inventory_controller/views/ProductDetail/ProductDetail.dart';
import 'package:inventory_controller/views/all_products/all_products.dart';
import '../views/dashboard/dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  Widget _offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 1 ,
              child: Row(children: <Widget>[
              Icon(Icons.radio_button_unchecked, color: Colors.blue , size: 12.0,),
              SizedBox(width: 20.0,),
              Text(
              "Lime",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            ],),
            )
            
          ),
          PopupMenuDivider(
                height: 10,
              
              ),
          PopupMenuItem(
            value: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 1 ,
              child: Row(children: <Widget>[
              Icon(Icons.radio_button_unchecked, color: Colors.blue , size: 12.0,),
              SizedBox(width: 20.0,),
              Text(
              "Travetine",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            ],),
            )
          ),
          
        ],
        onSelected: (value) {
            print("value:$value");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ProductDetail()));
          },
        icon: Icon(Icons.edit_attributes),
        offset: Offset(0, 0),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: DashBoard(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFBEB501),
          child: _offsetPopup(),
          onPressed: () {
          }
          ),
    );
  }
}
