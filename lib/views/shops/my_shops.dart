import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/addShopDialogue/add_shop_dialogue.dart';
import 'package:inventory_controller/components/animatedDialogue/animated_dialogue.dart';
import 'package:inventory_controller/models/userShops/user_shops.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/views/homePage/requests/new_requests.dart';

class MyShops extends StatelessWidget {
  MyShops({required this.shops});

  final List<UserShopModel> shops;
  Widget _buildShop(UserShopModel shop, BuildContext context) {
    return InkWell(
      onTap: () async {
        await putJson('active_shop',
            {"id": shop.associations.shopId, "shop_name": shop.shopName});
        await Navigator.pushNamed(context, '/home');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGreyColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text(
                  shop.shopName,
                  style: TextStyle(
                      color: hardGreyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(
                  Icons.shop,
                  color: primaryColor,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  shop.roleName,
                  style: TextStyle(
                      color: hardGreyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(vertical: 30),
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 15,
          ),
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
                  'Choose a shop',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        NewRequests(),
        SizedBox(height: 30),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: InkWell(
                  customBorder: CircleBorder(),
                  splashColor: primaryColor.withOpacity(.2),
                  onTap: () {
                    showNewDialog(
                        context: context,
                        child: AddShopDialogue(
                          id: 2,
                        ));
                  },
                  child: Center(
                      child: Icon(
                    Icons.add,
                    size: 30,
                    color: primaryColor,
                  )),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ...shops.map((shop) => Container(
              margin: EdgeInsets.only(bottom: 5, left: 20, right: 20),
              child: _buildShop(shop, context),
            )),
      ],
    ));
  }
}
