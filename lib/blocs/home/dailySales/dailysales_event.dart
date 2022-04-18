part of 'dailysales_bloc.dart';

abstract class DailysalesEvent extends Equatable {
  const DailysalesEvent();

  @override
  List<Object> get props => [];
}

class LoadDailySales extends DailysalesEvent{}
