import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailDailyChart/detaildailychart_bloc.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/chartSlide/daily_chart.dart';

class DetailDailyChartContainer extends StatelessWidget {
  final DetaildailychartBloc detaildailychartBloc;
  DetailDailyChartContainer(this.detaildailychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetaildailychartBloc, DetailDailychartState>(
      bloc: detaildailychartBloc,
      builder: (context, state) {
        return DetailDailyChartScreen(
          loading: state is DetailDailychartLoading ? true : false,
          error: state.error,
          overalDailyData: state.overalDailyData,
        );
      },
    );
  }
}
