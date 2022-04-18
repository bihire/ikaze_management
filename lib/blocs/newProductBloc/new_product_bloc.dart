import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_controller/models/product/product.dart';
import 'package:inventory_controller/servives/web_client.dart';

part 'new_product_event.dart';
part 'new_product_state.dart';

class NewProductBloc extends Bloc<NewProductEvent, NewProductState> {
  NewProductBloc() : super(NewProductInitial());

  @override
  Stream<NewProductState> mapEventToState(
    NewProductEvent event,
  ) async* {
    if (event is CreateProduct) {
      yield NewProductLoading();
      try {
        final response = await const WebClient().post('/products/add', {
          'product_name': event.product_name,
          'unit_quantity': event.unit_quantity,
          'unit_price': event.unit_price
        });

        yield NewProductLoaded(ProductModel.fromJson(response['data']));
      } catch (error) {
        yield NewProductError((error as Map)['error']);
      }
    }
  }
}
