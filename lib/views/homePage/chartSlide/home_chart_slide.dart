
import 'package:flutter/material.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/components/charts/bar_chart.dart';
import 'package:inventory_controller/components/slidingTabView/buttons_tabbar.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_daily_chart.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_monthly_container.dart';
import 'package:inventory_controller/containers/homePage/chartSlide/home_weekly_container.dart';

class HomeChartScreens extends StatelessWidget {
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
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
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
                          padding: const EdgeInsets.symmetric(horizontal:10.0),
                          child: Center(
                            child: HomeDailyChartContainer()
                          ),
                        ),
                      ),
                      Center(
                        child: HomeWeeklyChartContainer(),
                      ),
                      Center(
                        child: HomeMonthlyChartContainer(),
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
