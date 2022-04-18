import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/supplies/lastSupply/lastsupply_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/supplies/suppliesTransactionList/suppliestransactionlist_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
import 'package:inventory_controller/views/ProductDetail/SoldEntryPage/sold_entry_screen.dart';

class SoldEntryContainer extends StatefulWidget {
  final ProductInfoModel productInfo;
  SoldEntryContainer({required this.productInfo});

  @override
  _SoldEntryContainerState createState() => _SoldEntryContainerState();
}

class _SoldEntryContainerState extends State<SoldEntryContainer> {
  late LastsupplyBloc lastSupplyBloc;
  SuppliestransactionlistBloc supplyTransactionList =
      SuppliestransactionlistBloc();
  @override
  void initState() {
    super.initState();
    lastSupplyBloc = LastsupplyBloc();
    lastSupplyBloc.add(Loaddetaillastsupply(widget.productInfo.productId));
  }

  @override
  void dispose() {
    lastSupplyBloc.close();
    supplyTransactionList.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastsupplyBloc, LastsupplyState>(
      bloc: lastSupplyBloc,
      builder: (context, state) {
        return state.lastSupply != null ? Column(
              children: [
                Expanded(
                  child: state is LastsupplyInitial ? Material(child:Container()) : Material(child:SoldEntryScreen(
                          productInfo: widget.productInfo,
                          loading: state is LastsupplyLoading ? true : false,
                          lastSupply: state.lastSupply,
                          error: state.error,
                          supplyTransactionList: supplyTransactionList),
                ))
              ],
        ): Container();
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final ProductInfoModel productInfo;
  _CustomAppBar({required this.productInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: LeadingButton(
              color: Colors.transparent,
              icon: Icons.arrow_back_rounded,
              iconColor: darkColor,
              size: 37,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  '${productInfo.productName} supplies'.capitalizeFirstofEach,
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
