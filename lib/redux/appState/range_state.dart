import 'package:inventory_controller/models/money_transactions.dart';
import 'package:inventory_controller/models/range_count.dart';
import 'package:meta/meta.dart';

@immutable
class TransactionRangeState {
  TransactionRangeState({
    required this.isRangeDataLoading,
    required this.isNextRangePageAvailable,
    required this.rangeTransactions,
    required this.rangeCount,
    required this.rangeDate,
    this.rangeError,
  });

  final bool isRangeDataLoading;
  final bool isNextRangePageAvailable;
  final List<MoneyTransactionModel> rangeTransactions;
  final RangeCountModel rangeCount;
  final Map rangeDate;
  final Exception? rangeError;

  static const int transactionsPerPage = 10;

  factory TransactionRangeState.initial() => TransactionRangeState(
        isRangeDataLoading: false,
        isNextRangePageAvailable: false,
        rangeTransactions: const [],
        rangeDate: {
          "rangeFromDate": null,
          "rangeToDate": null,
        },
        rangeCount: RangeCountModel.fromJson(
            {"totalCount": null, "newTotal": null, "soldTotal": null}),
      );

  TransactionRangeState copyWith({
    isRangeDataLoading,
    isNextRangePageAvailable,
    rangeTransactions,
    rangeDate,
    rangeCount,
    rangeError,
  }) {
    return TransactionRangeState(
      isRangeDataLoading: isRangeDataLoading ?? this.isRangeDataLoading,
      isNextRangePageAvailable:
          isNextRangePageAvailable ?? this.isNextRangePageAvailable,
      rangeTransactions: rangeTransactions ?? this.rangeTransactions,
      rangeDate: rangeDate ?? this.rangeDate,
      rangeCount: rangeCount ?? this.rangeCount,
      rangeError: rangeError != this.rangeError ? rangeError : this.rangeError,
    );
  }

  @override
  String toString() {
    return "TransactionRangeState: isDataLoading = $isRangeDataLoading, "
        "isNextPageAvailable = $isNextRangePageAvailable, "
        "itemsLength = ${rangeTransactions.length}, "
        "itemsCount = ${rangeCount.totalCount}, "
        "rangeDate = ${rangeDate["rangeFromDate"]}, ${rangeDate["rangeToDate"]}"
        "error = $rangeError.";
  }
}
