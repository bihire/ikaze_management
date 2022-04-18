
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailWeeklyChart/detailweeklychart_bloc.dart';
import 'package:inventory_controller/views/homePage/chartSlide/weekly_chart.dart';

class DetailWeeklyChartContainer extends StatelessWidget {
  final DetailweeklychartBloc detailweeklychartBloc;
  DetailWeeklyChartContainer(this.detailweeklychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailweeklychartBloc, DetailweeklychartState>(
      bloc: detailweeklychartBloc,
      builder: (context, state) {
        return HomeWeeklyChartScreen(
            loading: state is DetailweeklychartLoading ? true : false,
            error: state.error,
            overalWeeklyData: state.overalWeeklyData);
      },
    );
  }
}
