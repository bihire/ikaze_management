import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/onScrollShadow/onscrollshadow_cubit.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class ScreenContainer extends StatefulWidget {
  final List<Widget> slivers;
  final AppBar appBar;
  final bool loading;
  ScreenContainer(
      {this.slivers = const [], required this.appBar, required this.loading});
  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  late ScrollController controller;
  late OnscrollshadowCubit onscrollshadowCubit;

  // late SalestransactionlistBloc salesTransactionListBloc;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    onscrollshadowCubit = OnscrollshadowCubit();
    // salesTransactionListBloc = SalestransactionlistBloc();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    // salesTransactionListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: BlocBuilder<OnscrollshadowCubit, OnscrollshadowState>(
          bloc: onscrollshadowCubit,
          builder: (context, state) {
            return AppBar(
                backgroundColor: widget.appBar.backgroundColor,
                titleSpacing: widget.appBar.titleSpacing,
                elevation: state.isShadow == true ? widget.appBar.elevation : 0,
                shadowColor: widget.appBar.shadowColor,
                automaticallyImplyLeading:
                    widget.appBar.automaticallyImplyLeading,
                title: widget.appBar.title);
          },
        ),
      ),
      body: SafeArea(
        child: widget.loading
            ? Material(
                child: Center(
                    child: Container(
                        width: 80, height: 80, child: LoadingIndicator())),
              )
            : RefreshIndicator(
                color: primaryColor,
                onRefresh: _onRefresh,
                child: CustomScrollView(
                  controller: controller,
                  slivers: widget.slivers,
                ),
              ),
      ),
    );
  }

  void _scrollListener() {
    if (controller.position.extentBefore == 0.0 &&
        onscrollshadowCubit.state.isShadow == true) {
      print('remove');
      onscrollshadowCubit.removeShadow();
    } else if (controller.position.extentBefore != 0.0 &&
        onscrollshadowCubit.state.isShadow == false) {
      print('add');
      onscrollshadowCubit.addShadow();
    }
    // if (!widget.loading &&
    //     salesTransactionListBloc.state is SalestransactionlistLoaded &&
    //     controller.position.extentAfter < 20.0) {
    //   _debouncer.run(() => salesTransactionListBloc.add(Loadsalestransactions(
    //       pageNumber: (salesTransactionListBloc.state.transactions.length ~/
    //               transactionsPerPage) +
    //           1,
    //       productId: widget.productInfo.productId)));

    //   // widget.loadNextPage('${widget.productInfo.productId}');
    // }
  }

  Future _onRefresh() {
    // widget.refresh();
    return Future.value();
  }
}
