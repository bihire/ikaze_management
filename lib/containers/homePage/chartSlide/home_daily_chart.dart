import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeDailyChart/homedailychart_bloc.dart';
import 'package:inventory_controller/views/homePage/chartSlide/daily_chart.dart';

class HomeDailyChartContainer extends StatelessWidget {
  final HomedailychartBloc homedailychartBloc;
  HomeDailyChartContainer(this.homedailychartBloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomedailychartBloc, HomeDailychartState>(
      bloc: homedailychartBloc,
      builder: (context, state) {
        return state is HomeDailychartInitial
            ? Container()
            : HomeDailyChartScreen(
                loading: state is HomeDailychartLoading ? true : false,
                error: state.error,
                overalDailyData: state.overalDailyData,
              );
      },
    );
  }
}
