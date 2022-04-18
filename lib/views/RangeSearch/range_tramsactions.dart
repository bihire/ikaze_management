import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_controller/blocs/onScrollShadow/onscrollshadow_cubit.dart';
import 'package:inventory_controller/blocs/rangeSearch/rangesearch_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/common/debouncer.dart';
import 'package:inventory_controller/components/custom_appbar.dart';
import 'package:inventory_controller/components/custom_progress_indicator.dart';
import 'package:inventory_controller/components/transaction_item.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/auto_animated_utils.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/range_count.dart';
import 'package:inventory_controller/containers/homePage/rangeTransactions/range_count_loading.dart';
import 'package:inventory_controller/models/range_count.dart';

class RangeTransactions extends StatefulWidget {
  RangeTransactions({
    required this.loading,
    required this.isNextpage,
    required this.transactions,
    this.refresh,
    required this.onSearch,
    required this.rangeCount,
    required this.rangeDate,
    this.loadNextPage,
    required this.error,
  });

  final RangeStatus loading;
  final bool isNextpage;
  final transactions;
  final Function? refresh;
  final Function(DateTime fromDate, DateTime toDate) onSearch;
  final Function? loadNextPage;
  final String? error;
  final RangeDate? rangeDate;
  final RangeCountModel? rangeCount;

  @override
  _RangeTransactionsState createState() => _RangeTransactionsState();
}

class _RangeTransactionsState extends State<RangeTransactions> {
  ScrollController _scrollController = ScrollController();
  final _scrollThresholdInPixels = 100.0;
  late OnscrollshadowCubit onscrollshadowCubit;
  final _debouncer = Debouncer(milliseconds: 500);
  final RangesearchBloc rangesearchBloc = RangesearchBloc();

  @override
  void initState() {
    onscrollshadowCubit = OnscrollshadowCubit();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    onscrollshadowCubit = OnscrollshadowCubit();
    _scrollController.dispose();
    rangesearchBloc.close();
    super.dispose();
  }

  bool rangeSearchLoading = false;
  bool firstClick = false;
  DateTime? fromDate;
  DateTime endDate = new DateTime.now();
  void notifySearch() {
    setState(() {
      firstClick = true;
    });
  }

  void _setFormDate(DateTime pickeDate) {
    setState(() {
      fromDate = pickeDate;
    });
  }

  void _setToDate(DateTime pickeDate) {
    setState(() {
      endDate = pickeDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    switchFunction(RangeStatus loading, int transactionsLength) {
      if (loading == RangeStatus.initial && transactionsLength == 0)
        return LayoutBuilder(
            builder: (context, constraints) => ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                child: Text('Choose a date range above.',
                                    style: TextStyle(
                                        color: light1ShadeColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400))),
                            Container(
                              child: SvgPicture.asset(
                                  "assets/svg/undraw_chore_list_re_2lq8.svg",
                                  // color: Color(0xFF0bd50b),
                                  height: width - 40,
                                  width: width - 40,
                                  fit: BoxFit.scaleDown),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
      if (loading == RangeStatus.loading) return RangeCountLoading();
      if (loading == RangeStatus.success && transactionsLength == 0)
        return LayoutBuilder(
            builder: (context, constraints) => ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: SvgPicture.asset(
                                  "assets/svg/undraw_no_data_re_kwbl.svg",
                                  // color: Color(0xFF0bd50b),
                                  height: width - 80,
                                  width: width - 80,
                                  fit: BoxFit.scaleDown),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                child: Text('No data found',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400))),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
      else
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: RangeCount(
                    rangeCount: widget.rangeCount!,
                    rangeDate: widget.rangeDate!),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                sliver: LiveSliverList(
                  controller: _scrollController,
                  showItemInterval: Duration(milliseconds: 30),
                  // showItemDuration: Duration(milliseconds: 100),
                  itemCount: widget.isNextpage
                      ? widget.transactions.length + 1
                      : widget.transactions.length,
                  itemBuilder: animationItemBuilder(
                      (index, transitionLength) => (index < transitionLength)
                          ? TransactionItem(
                              itemIndex: index,
                              transaction: widget.transactions[index])
                          : CustomProgressIndicator(
                              isActive:
                                  // widget.error
                                  false),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      transactionLength: widget.transactions.length),
                ),
              ),
            ],
          ),
        );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: BlocBuilder<OnscrollshadowCubit, OnscrollshadowState>(
          bloc: onscrollshadowCubit,
          builder: (context, state) {
            return CustomAppBar(
                elevation: state.isShadow == true ? 4 : 0,
                notifySearch: notifySearch,
                setFormDate: _setFormDate,
                setToDate: _setToDate,
                fromDate: fromDate,
                toDate: endDate,
                rangeSearchLoading: (widget.loading == RangeStatus.loading &&
                    widget.transactions.length == 0),
                onSearch: widget.onSearch);
          },
        ),
      ),
      body: SafeArea(
        child: switchFunction(widget.loading, widget.transactions.length),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.extentBefore == 0.0 &&
        onscrollshadowCubit.state.isShadow == true) {
      onscrollshadowCubit.removeShadow();
    } else if (_scrollController.position.extentBefore != 0.0 &&
        onscrollshadowCubit.state.isShadow == false) {
      onscrollshadowCubit.addShadow();
    }
    // final maxScroll = _scrollController.position.maxScrollExtent;
    // final currentScroll = _scrollController.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThresholdInPixels &&
    //     widget.loading == RangeStatus.success) {
    //   // _debouncer.run(() => widget.loadNextPage());
    // }
  }

  Future _onRefresh() {
    // widget.refresh(
    //     widget.rangeDate!.rangeFromDate, widget.rangeDate!.rangeToDate);
    return Future.value();
  }
}
