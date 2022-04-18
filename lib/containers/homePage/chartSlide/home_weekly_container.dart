import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeWeeklyChart/homeweeklychart_bloc.dart';
import 'package:inventory_controller/views/homePage/chartSlide/weekly_chart.dart';

class HomeWeeklyChartContainer extends StatelessWidget {
  final HomeweeklychartBloc homeweeklychartBloc;
  HomeWeeklyChartContainer(this.homeweeklychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeweeklychartBloc, HomeweeklychartState>(
      bloc: homeweeklychartBloc,
      builder: (context, state) {
        return HomeWeeklyChartScreen(
            loading: state is HomeweeklychartLoading ? true : false,
            error: state.error,
            overalWeeklyData: state.overalWeeklyData);
      },
    );
  }
}
