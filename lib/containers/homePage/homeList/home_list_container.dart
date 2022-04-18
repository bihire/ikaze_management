import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/home/homeTransactioList/hometransactionlist_bloc.dart';
import 'package:inventory_controller/views/homePage/homeTransactionList/home_transaction_list.dart';

class HomeTransactionListContainer extends StatefulWidget {
  final HometransactionlistBloc homeTransactionListBloc;
  HomeTransactionListContainer({
    required this.homeTransactionListBloc,
  });
  @override
  _HomeTransactionListContainerState createState() =>
      _HomeTransactionListContainerState();
}

class _HomeTransactionListContainerState
    extends State<HomeTransactionListContainer> {

  @override
  void initState() {
    widget.homeTransactionListBloc
        .add(LoadHomeTransactionAction(pageNumber: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.homeTransactionListBloc,
      child: BlocBuilder<HometransactionlistBloc, HometransactionlistState>(
        bloc: widget.homeTransactionListBloc,
        builder: (context, state) {
          return HomeTransactionListScreen(
            loading: state is HomeTransactionlistLoading ? true : false,
            transactions: state.transactions,
            error: state.error,
          );
        },
      ),
    );
  }
}
