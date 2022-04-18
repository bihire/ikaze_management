// import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventory_controller/blocs/productDetail/sales/salesTransactionList/salestransactionlist_bloc.dart';
import 'package:inventory_controller/components/ScreenContainer/screen_container.dart';
import 'package:inventory_controller/components/customDropDown/custom_drop_down.dart';
import 'package:inventory_controller/components/loadingIndicator/loading_indicator.dart';
import 'package:inventory_controller/components/page_transition/enum.dart';
import 'package:inventory_controller/components/page_transition/page_transtion.dart';
import 'package:inventory_controller/components/section_tilte.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/sales_container.dart';
// import 'package:inventory_controller/containers/homePage/homeList/home_list_container.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';
import 'package:inventory_controller/models/screenArguments/screen_arguments.dart';
import 'package:inventory_controller/utils/auth/auth.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/common.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
// import 'package:inventory_controller/containers/itemDetail/transactions/new_product_list_container.dart';
// import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/utils/constants.dart';
import 'package:inventory_controller/utils/debounce.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/detail_chart_slide.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/components/top_summary_card.dart';
import 'package:inventory_controller/views/newProduct/new_product.dart';
import 'package:skeleton_text/skeleton_text.dart';

import 'components/persistent_header.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen(
      {Key? key,
      required this.loading,
      required this.dailySales,
      required this.error,
      required this.chartBlocs,
      required this.productInfo});
  final ProductInfoModel productInfo;
  final ChartBlocModel chartBlocs;
  final bool loading;
  final int? dailySales;
  final String? error;
  @override
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryScreen>
    with AutomaticKeepAliveClientMixin<NewEntryScreen> {
  late ScrollController controller;
  late SalestransactionlistBloc salesTransactionListBloc;
  // to start
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    salesTransactionListBloc = SalestransactionlistBloc();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    salesTransactionListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      loading: widget.loading,
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        titleSpacing: 0,
        elevation: 4.0,
        shadowColor: lightGreyColor,
        automaticallyImplyLeading: false,
        title: AppBarContainer(productInfo: widget.productInfo),
      ),
      slivers: [
        // SliverAppBar(
        //     backgroundColor: Colors.white,
        //     pinned: true,
        //     titleSpacing: 0,
        //     elevation: 3,
        //     automaticallyImplyLeading: false,
        //     title: AppBarContainer(scrollPosition: controller)),
        SliverToBoxAdapter(
            child: TopSummaryCard(
          productInfo: widget.productInfo,
          dailySales: widget.dailySales!,
        )),
        SliverToBoxAdapter(
          child: ProductDetailChartScreens(
              productInfo: widget.productInfo, chartBlocs: widget.chartBlocs),
        ),
        SliverToBoxAdapter(
          child: SectionTitle(
            title: 'Sales History',
          ),
        ),
        SalesTransactionListContainer(
            productInfo: widget.productInfo,
            salesTransactionListBloc: salesTransactionListBloc),
      ],
    );
  }

  void _scrollListener() {
    if (!widget.loading &&
        salesTransactionListBloc.state is SalestransactionlistLoaded &&
        controller.position.extentAfter < 20.0) {
      _debouncer.run(() => salesTransactionListBloc.add(Loadsalestransactions(
          pageNumber: (salesTransactionListBloc.state.transactions.length ~/
                  transactionsPerPage) +
              1,
          productId: widget.productInfo.productId)));

      // widget.loadNextPage('${widget.productInfo.productId}');
    }
  }

  Future _onRefresh() {
    // widget.refresh();
    return Future.value();
  }

  @override
  bool get wantKeepAlive => true;
}

class AppBarContainer extends StatefulWidget {
  final ProductInfoModel productInfo;
  AppBarContainer({Key? key, required this.productInfo});
  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
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
                '${widget.productInfo.productName} sales'.capitalizeFirstofEach,
                style: TextStyle(color: Colors.black),
              )),
        ),
        CustomDropdown(
            child: LeadingButton(
              color: lightGreyColor,
              icon: Icons.more_horiz_outlined,
              iconColor: darkColor,
              size: 37,
              onPressed: null,
            ),
            text: 'home',
            items: [
              DropDownItem.first(
                  text: 'Add new product',
                  iconData: Icons.add,
                  isSelected: false,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                            curve: Curves.easeIn,
                            reverseDuration: Duration(milliseconds: 300),
                            duration: Duration(milliseconds: 200),
                            child: NewProductPage(),
                            type: PageTransitionType.rightToLeft));
                  }),
              DropDownItem(
                text: "Search by range",
                iconData: Icons.search,
                isSelected: false,
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/range_search');
                },
              ),
              DropDownItem.last(
                text: "Delete",
                iconData: Icons.delete,
                isSelected: true,
                color: primaryLightColor,
                backgroundColor: primaryRedColor,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signin',
                      arguments: ScreenArguments.redirect);
                },
              ),
            ]),
      ],
    );
  }
}
