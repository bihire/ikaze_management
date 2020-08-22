import 'package:flutter/material.dart';
import 'package:inventory_controller/components/bottom_bar_navigation_pattern/bottom_bar_navigation_pattern_example.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/bar_chart.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/top_summary_card.dart';

class NewEntryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
    Tab(text: 'bro'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        TopSummaryCard(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        if (_tabController.index > 0) {
                          _tabController.animateTo(_tabController.index - 1);
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Can't go back"),
                          ));
                        }
                      },
                    ),
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        labelStyle: TextStyle(color: Colors.black),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.blue,
                        tabs: List.generate(
                          20,
                          (index) {
                            return Tab(
                              text: "Tab $index",
                            );
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        if (_tabController.index + 1 < 20) {
                          _tabController.animateTo(_tabController.index + 1);
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Can't move forward"),
                          ));
                        }
                      },
                    ),
                  ],
                ),
                //   }
              ),
              // )
              BarChartSample1()
            ],
          ),
        ),
        // BottomBarNavigationPatternExample(),
      ],
    );
  }
}
