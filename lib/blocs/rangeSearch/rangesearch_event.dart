part of 'rangesearch_bloc.dart';


abstract class RangesearchEvent extends Equatable {
  const RangesearchEvent();

  @override
  List<Object> get props => [];
}

class LoadRangesearch extends RangesearchEvent {
  final DateTime fromDate;
  final DateTime toDate;

  LoadRangesearch(this.fromDate, this.toDate) : super();
}
