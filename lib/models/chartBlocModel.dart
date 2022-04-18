import 'package:inventory_controller/blocs/home/chartSlides/homeDailyChart/homedailychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeMonthlyChart/homemonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/home/chartSlides/homeWeeklyChart/homeweeklychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailDailyChart/detaildailychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailMonthlyChart/detailmonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailWeeklyChart/detailweeklychart_bloc.dart';

class ChartBlocModel {
  HomedailychartBloc? homedailychartBloc;
  HomeweeklychartBloc? homeweeklychartBloc;
  HomemonthlychartBloc? homemonthlychartBloc;
  DetaildailychartBloc? dailysaleschartBloc;
  DetailweeklychartBloc? weeklysaleschartBloc;
  DetailmonthlychartBloc? monthlysaleschartBloc;
  ChartBlocModel.home(
      {required this.homedailychartBloc,
      required this.homemonthlychartBloc,
      required this.homeweeklychartBloc});
  ChartBlocModel.detail(
      {required this.dailysaleschartBloc,
      required this.weeklysaleschartBloc,
      required this.monthlysaleschartBloc});
}
