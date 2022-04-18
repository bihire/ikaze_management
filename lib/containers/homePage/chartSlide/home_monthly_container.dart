import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeMonthlyChart/homemonthlychart_bloc.dart';
import 'package:inventory_controller/views/homePage/chartSlide/monthly_chart.dart';

class HomeMonthlyChartContainer extends StatelessWidget {
  final HomemonthlychartBloc homemonthlychartBloc;
  HomeMonthlyChartContainer(this.homemonthlychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomemonthlychartBloc, HomemonthlychartState>(
      bloc: homemonthlychartBloc,
      builder: (context, state) {
        return HomeMonthlyChartScreen(
            loading: state is HomemonthlychartLoading ? true : false,
            error: state.error,
            overalMonthlyData: state.overalMonthlyData
            // refresh:

            );
      },
    );
  }
}
