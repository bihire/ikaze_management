import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:inventory_controller/blocs/home/homeTransactioList/hometransactionlist_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/salesTransactionList/salestransactionlist_bloc.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/homePage/homeTransactionList/home_transaction_list.dart';

class SalesTransactionListContainer extends StatefulWidget {
  final SalestransactionlistBloc salesTransactionListBloc;
  final ProductInfoModel productInfo;
  SalesTransactionListContainer({
    required this.salesTransactionListBloc,
    required this.productInfo
  });
  @override
  _SalesTransactionListContainerState createState() =>
      _SalesTransactionListContainerState();
}

class _SalesTransactionListContainerState
    extends State<SalesTransactionListContainer> {
  @override
  void initState() {
    widget.salesTransactionListBloc
        .add(Loadsalestransactions(pageNumber: 1, productId: widget.productInfo.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.salesTransactionListBloc,
      child: BlocBuilder<SalestransactionlistBloc, SalestransactionlistState>(
        bloc: widget.salesTransactionListBloc,
        builder: (context, state) {
          return HomeTransactionListScreen(
            loading: state is SalestransactionlistLoading ? true : false,
            transactions: state.transactions,
            error: state.error,
          );
        },
      ),
    );
  }
}
