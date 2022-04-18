part of 'user_shops_bloc.dart';

@immutable
abstract class UserShopsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUserShops extends UserShopsEvent {}
