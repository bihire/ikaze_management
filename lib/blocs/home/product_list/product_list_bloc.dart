import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/servives/shared_preferences.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:meta/meta.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<LoadProductList>((event, emit) async {
      emit(ProductListLoading());
      try {
        final shop = await getJson('active_shop');
        final response =
            await const WebClient().get('/products?shop_id=${shop['id']}');
        final jsonData = response['data'] as List;
        emit(ProductListLoaded(
            jsonData.map((item) => ProductModel.fromJson(item)).toList()));
      } catch (error) {
        emit(ProductListError((error as Map)['message']));
      }
    });
  }
}
