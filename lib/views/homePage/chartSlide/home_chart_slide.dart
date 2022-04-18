import 'package:flutter/material.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeDailyChart/homedailychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeMonthlyChart/homemonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeWeeklyChart/homeweeklychart_bloc.dart';
// import 'package:inventory_controller/common/constants.dart';
// import 'package:inventory_controller/components/charts/bar_chart.dart';
import 'package:inventory_controller/components/slidingTabView/buttons_tabbar.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_daily_chart.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_monthly_container.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_weekly_container.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';

class HomeChartScreens extends StatefulWidget {
  final ChartBlocModel chartBlocs;
  HomeChartScreens({required this.chartBlocs});

  @override
  _HomeChartScreensState createState() => _HomeChartScreensState();
}

class _HomeChartScreensState extends State<HomeChartScreens> {
  @override
  void initState() {
    widget.chartBlocs.homedailychartBloc!.add(LoadHomeDailyChart());
    widget.chartBlocs.homeweeklychartBloc!.add(LoadHomeWeeklyChart());
    widget.chartBlocs.homemonthlychartBloc!.add(LoadHomeMonthlyChart());
    super.initState();
  }

  @override
  void dispose() {
    // widget.chartBlocs.homedailychartBloc.close();
    // widget.chartBlocs.homeweeklychartBloc.close();
    // widget.chartBlocs.homemonthlychartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
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
                    // color: lightGreyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                          child: HomeDailyChartContainer(
                              widget.chartBlocs.homedailychartBloc!)),
                    ),
                  ),
                  Center(
                    child: HomeWeeklyChartContainer(
                        widget.chartBlocs.homeweeklychartBloc!),
                  ),
                  Center(
                    child: HomeMonthlyChartContainer(
                        widget.chartBlocs.homemonthlychartBloc!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
