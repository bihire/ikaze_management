part of 'rangesearch_bloc.dart';

enum RangeStatus { initial, loading, success, error }

class RangesearchState extends Equatable {
  const RangesearchState(
      {this.status = RangeStatus.initial,
      this.isNextpage = true,
      this.rangeTransactions = const <MoneyTransactionModel>[],
      this.rangeCount,
      this.rangeDate,
      this.error});
  final RangeStatus status;
  final bool isNextpage;
  final List<MoneyTransactionModel> rangeTransactions;
  final RangeCountModel? rangeCount;
  final RangeDate? rangeDate;
  final String? error;

  static const int transactionsPerPage = 10;

  RangesearchState copyWith(
      {bool? isNextpage,
      RangeStatus? status,
      List<MoneyTransactionModel>? rangeTransactions,
      RangeCountModel? rangeCount,
      RangeDate? rangeDate,
      String? error}) {
    return RangesearchState(
        status: status ?? this.status,
        isNextpage: isNextpage ?? this.isNextpage,
        rangeTransactions: rangeTransactions ?? this.rangeTransactions,
        rangeCount: rangeCount ?? this.rangeCount,
        rangeDate: rangeDate ?? this.rangeDate,
        error: error);
  }

  @override
  String toString() {
    return '''PostState { isNextpage: $isNextpage, rangeTransactions: $rangeTransactions, rangeCount: $rangeCount }''';
  }

  @override
  List<Object?> get props =>
      [status, isNextpage, rangeTransactions, rangeCount, rangeDate, error];
}

// class RangesearchInitial extends RangesearchState {}

// class RangesearchLoading extends RangesearchState {}

// class RangesearchLoaded extends RangesearchState {
//   // final bool? isNextpage;
//   // List<MoneyTransactionModel>? rangeTransactions;
//   // RangeCountModel? rangeCount;
//   // RangeDate? rangeDate;
//   // RangesearchLoaded.cop({
//   //   isNextpage: this.isNextpage,
//   // });
// }

// class RangesearchError extends RangesearchState {
//   final String error;

//   RangesearchError(this.error);
// }
