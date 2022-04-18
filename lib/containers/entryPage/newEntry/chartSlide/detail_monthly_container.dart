import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailMonthlyChart/detailmonthlychart_bloc.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/detail_monthly_chart.dart';

class DetailMonthlyChartContainer extends StatelessWidget {
  final DetailmonthlychartBloc homemonthlychartBloc;
  DetailMonthlyChartContainer(this.homemonthlychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailmonthlychartBloc, DetailmonthlychartState>(
      bloc: homemonthlychartBloc,
      builder: (context, state) {
        return DetailMonthlyChartScreen(
            loading: state is DetailmonthlychartLoading ? true : false,
            error: state.error,
            overalMonthlyData: state.overalMonthlyData
            // refresh:

            );
      },
    );
  }
}
