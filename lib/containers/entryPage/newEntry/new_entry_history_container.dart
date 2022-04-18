import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
// import 'package:inventory_controller/components/sticky_header_list.dart';
// import 'package:flutter/material.dart';
import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/product/product.dart';
// import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
// import 'package:inventory_controller/redux/actions/all_transactions_actions.dart';
// import 'package:inventory_controller/redux/appState/app_state.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';
import 'package:redux/redux.dart';

class NewEntryContainer extends StatelessWidget {
  final ProductInfoModel productInfo;
  const NewEntryContainer({
    Key? key,
    required this.productInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    //  NewEntryScreen(
    //   loading: vm.isDataLoading,
    //   // isNextPageAvailable: vm.isNextPageAvailable,
    //   // transactions: vm.transactions,
    //   // refresh: vm.onRefresh,
    //   // loadNextPage: vm.onLoadNextPage,
    //   // noError: vm.noError,
    // );
  }
}
