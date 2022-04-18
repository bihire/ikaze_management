import 'package:bloc/bloc.dart';
import 'package:inventory_controller/models/userShops/user_shops.dart';
import 'package:inventory_controller/servives/web_client.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_shops_event.dart';
part 'user_shops_state.dart';

class UserShopsBloc extends Bloc<UserShopsEvent, UserShopsState> {
  UserShopsBloc() : super(UserShopsState()) {
    on<LoadUserShops>((event, emit) async {
      emit(state.copyWith(status: ShopStatus.loading));
      try {
        final response = await const WebClient().get('/shops');
        List<UserShopModel> shops = (response['data'] as List)
                .map((item) => UserShopModel.fromJson(item))
                .toList();
        emit(state.copyWith(
            status: ShopStatus.success,
            shops: shops));
      } catch (error) {
        emit(state.copyWith(status: ShopStatus.error));
      }
    });
  }
}
