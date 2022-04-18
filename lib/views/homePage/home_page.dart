import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/home/homeTransactioList/hometransactionlist_bloc.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/components/section_tilte.dart';
import 'package:inventory_controller/containers/homePage/homeList/home_list_container.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';
// import 'package:inventory_controller/redux/appState/all_transactions_state.dart';
import 'package:inventory_controller/views/homePage/chartSlide/daily_sales_screen.dart';
import 'package:inventory_controller/views/homePage/chartSlide/home_chart_slide.dart';
import 'package:inventory_controller/views/homePage/requests/new_requests.dart';

import 'components/persistent_header.dart';

class HomePageScreen extends StatefulWidget {
  final bool loading;
  final ChartBlocModel chartBlocs;
  final ScrollController scrollController;
  // final bool isNextPageAvailable;
  // final Store<AppState> store;

  const HomePageScreen(
      {Key? key,
      required this.loading,
      required this.dailySales,
      this.error,
      required this.scrollController,
      required this.chartBlocs
      // this.isNextPageAvailable,
      // this.transactions,
      // this.store,
      // this.refresh,
      // this.loadNextPage,
      // this.noError,
      });

  final int? dailySales;
  // final bool isNextPageAvailable;
  // final transactions;
  // final Function refresh;
  // final Function loadNextPage;
  final String? error;
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
  late ScrollController controller;
  late HometransactionlistBloc homeTransactionListBloc;

  @override
  void initState() {
    super.initState();
    homeTransactionListBloc = HometransactionlistBloc();
    // controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    homeTransactionListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
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
                controller: widget.scrollController,
                slivers: [
                  // SliverToBoxAdapter(child: NewRequests()),
                  SliverToBoxAdapter(
                    child: Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 10.0),
                        width: MediaQuery.of(context).size.width * 1,
                        child: DailySalesScreen(widget.dailySales!)),
                  ),
                  SliverToBoxAdapter(
                    child: HomeChartScreens(chartBlocs: widget.chartBlocs),
                  ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: 'History',
                    ),
                  ),
                  HomeTransactionListContainer(
                      homeTransactionListBloc: homeTransactionListBloc),
                ],
              ),
            ),
    );
  }

  void _scrollListener() {
    if (!widget.loading &&
        // !widget.isNextPageAvailable &&
        controller.position.extentAfter < 20.0) {
      homeTransactionListBloc.add(LoadHomeTransactionAction(
          pageNumber:
              (homeTransactionListBloc.state.transactions.length ~/ 10) + 1));
    }
  }

  Future _onRefresh() {
    // widget.refresh();
    return Future.value();
  }
}
