import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/supplies/suppliesTransactionList/suppliestransactionlist_bloc.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/homePage/homeTransactionList/home_transaction_list.dart';

class SuppplyListContainer extends StatefulWidget {
  final SuppliestransactionlistBloc supplyListBloc;
  final ProductInfoModel productInfo;
  SuppplyListContainer({
    required this.supplyListBloc,
    required this.productInfo
  });
  @override
  _SuppplyListContainerState createState() =>
      _SuppplyListContainerState();
}

class _SuppplyListContainerState
    extends State<SuppplyListContainer> {
  @override
  void initState() {
    widget.supplyListBloc.add(Loadsuppliestransactions(pageNumber: 1, productId: widget.productInfo.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuppliestransactionlistBloc, SuppliestransactionlistState>(
      bloc: widget.supplyListBloc,
      builder: (context, state) {
        return HomeTransactionListScreen(
          loading: state is SuppliestransactionlistLoading ? true : false,
          transactions: state.transactions,
          error: state.error,
        );
      },
    );
  }
}
