part of 'user_shops_bloc.dart';

enum ShopStatus { initial, loading, success, error }

@immutable
class UserShopsState extends Equatable {
  UserShopsState({this.shops = const [], this.status = ShopStatus.initial});
  final List<UserShopModel> shops;
  final ShopStatus status;

  UserShopsState copyWith({
    List<UserShopModel>? shops,
    ShopStatus? status
  }) {
    return UserShopsState(
      shops: shops ?? this.shops,
      status: status ?? this.status
      );
  }

  @override
  List<Object> get props => [shops, status];
}

class UserShopsInitial extends UserShopsState {}
