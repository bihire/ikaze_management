import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeDailyChart/homedailychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeMonthlyChart/homemonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeWeeklyChart/homeweeklychart_bloc.dart';
import 'package:inventory_controller/blocs/home/dailySales/dailysales_bloc.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';
import 'package:inventory_controller/views/homePage/home_page.dart';

class HomePageContainer extends StatefulWidget {
  final ScrollController scrollController;
  HomePageContainer({required this.scrollController});
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  late DailysalesBloc dailysalesBloc;
  HomedailychartBloc homedailychartBloc = HomedailychartBloc();
  HomeweeklychartBloc homeweeklychartBloc = HomeweeklychartBloc();
  HomemonthlychartBloc homemonthlychartBloc = HomemonthlychartBloc();
  @override
  void initState() {
    super.initState();
    dailysalesBloc = DailysalesBloc();
    dailysalesBloc.add(LoadDailySales());
  }

  @override
  void dispose() {
    dailysalesBloc.close();
    homedailychartBloc.close();
    homeweeklychartBloc.close();
    homemonthlychartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailysalesBloc, DailysalesState>(
      bloc: dailysalesBloc,
      builder: (context, state) {
        return state is DailysalesInitial
            ? Material()
            : HomePageScreen(
                loading: state is DailysalesLoading ? true : false,
                dailySales: state.dailySales,
                error: state.error,
                scrollController: widget.scrollController,
                chartBlocs: ChartBlocModel.home(
                    homedailychartBloc: homedailychartBloc,
                    homeweeklychartBloc: homeweeklychartBloc,
                    homemonthlychartBloc: homemonthlychartBloc)
                // isNextPageAvailable: vm.isNextPageAvailable,
                // transactions: vm.transactions,
                // store: vm.store,
                // refresh: vm.onRefresh,
                );
      },
    );
  }
}
