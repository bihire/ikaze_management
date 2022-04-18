import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailDailyChart/detaildailychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailMonthlyChart/detailmonthlychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/chartSlides/detailWeeklyChart/detailweeklychart_bloc.dart';
import 'package:inventory_controller/blocs/productDetail/sales/dailySales/dailysales_bloc.dart';
import 'package:inventory_controller/models/chartBlocModel.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/views/ProductDetail/NewEntryPage/NewEntryPage.dart';

class DetailSalesContainer extends StatefulWidget {
  final ProductInfoModel productInfo;
  DetailSalesContainer({required this.productInfo});

  @override
  _DetailSalesContainerState createState() => _DetailSalesContainerState();
}

class _DetailSalesContainerState extends State<DetailSalesContainer> {
  late DetaildailysalesBloc dailysalesBloc;
  late DetaildailychartBloc dailysaleschartBloc;
  late DetailweeklychartBloc weeklysaleschartBloc;
  late DetailmonthlychartBloc monthlysaleschartBloc;
  @override
  void initState() {
    dailysaleschartBloc = DetaildailychartBloc();
    weeklysaleschartBloc = DetailweeklychartBloc();
    monthlysaleschartBloc = DetailmonthlychartBloc();
    super.initState();
    dailysalesBloc = DetaildailysalesBloc();
    dailysalesBloc.add(LoaddetaildailySales(widget.productInfo.productId));
  }

  @override
  void dispose() {
    dailysalesBloc.close();
    dailysaleschartBloc.close();
    weeklysaleschartBloc.close();
    monthlysaleschartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetaildailysalesBloc, DetaildailysalesState>(
      bloc: dailysalesBloc,
      builder: (context, state) {
        return state is DetaildailysalesInitial ? Material(child: Container()) : Material(child: NewEntryScreen(
            productInfo: widget.productInfo,
            loading: state is DetaildailysalesLoading ? true : false,
            dailySales: state.dailySales,
            error: state.error,
            chartBlocs: ChartBlocModel.detail(
                dailysaleschartBloc: dailysaleschartBloc,
                weeklysaleschartBloc: weeklysaleschartBloc,
                monthlysaleschartBloc: monthlysaleschartBloc)));
      },
    );
  }
}
