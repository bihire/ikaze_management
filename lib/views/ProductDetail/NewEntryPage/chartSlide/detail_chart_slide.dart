import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/home/dailySales/dailysales_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailDailyChart/detaildailychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailMonthlyChart/detailmonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailWeeklyChart/detailweeklychart_bloc.dart';
import 'package:inventory_controller/components/slidingTabView/buttons_tabbar.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/chartSlide/detail_daily_chart.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/chartSlide/detail_monthly_container.dart';
import 'package:inventory_controller/containers/entryPage/newEntry/chartSlide/detail_weekly_container.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';
import 'package:inventory_controller/models/product/product.dart';

class ProductDetailChartScreens extends StatefulWidget {
  final ProductInfoModel productInfo;
  final ChartBlocModel chartBlocs;
  ProductDetailChartScreens({required this.productInfo,required this.chartBlocs});

  @override
  _ProductDetailChartScreensState createState() =>
      _ProductDetailChartScreensState();
}

class _ProductDetailChartScreensState extends State<ProductDetailChartScreens> {
  @override
  void initState() {
    widget.chartBlocs.dailysaleschartBloc!.add(LoadDetailDailyChart());
    widget.chartBlocs.weeklysaleschartBloc!.add(LoadDetailWeeklyChart());
    widget.chartBlocs.monthlysaleschartBloc!.add(LoadDetailMonthlyChart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.red, width: 1, style: BorderStyle.solid)
      ),
      // width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height / 2,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              backgroundColor: Color(0xFFBEB501),
              radius: 20,
              unselectedBackgroundColor: Colors.grey[300]!,
              unselectedLabelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
              labelStyle: TextStyle(color: Colors.white),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 11.0),
              tabs: [
                Tab(
                  text: "Overall(Dailly)",
                ),
                Tab(
                  text: "Overall(Weekly)",
                ),
                Tab(
                  text: "Overall(Monthly)",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                          child: DetailDailyChartContainer(
                              widget.chartBlocs.dailysaleschartBloc!)),
                    ),
                  ),
                  Center(
                    child: DetailWeeklyChartContainer(
                        widget.chartBlocs.weeklysaleschartBloc!),
                  ),
                  Center(
                    child: DetailMonthlyChartContainer(
                        widget.chartBlocs.monthlysaleschartBloc!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
