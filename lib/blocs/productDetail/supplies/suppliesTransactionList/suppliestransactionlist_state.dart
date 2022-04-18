part of 'suppliestransactionlist_bloc.dart';

abstract class SuppliestransactionlistState extends Equatable {
  final List<MoneyTransactionModel> transactions;
  final String? error;

  SuppliestransactionlistState({this.transactions = const [], this.error});

  SuppliestransactionlistState copyWith({
    List<MoneyTransactionModel>? transactions,
    // bool hasReachedMax,
  }) {
    return SuppliestransactionlistLoaded(
      transactions: transactions ?? this.transactions,
      // hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() => 'PostLoaded { posts: ${transactions.length}}';

  @override
  List<Object?> get props => [transactions, error];
}

class SuppliestransactionlistInitial extends SuppliestransactionlistState {
  // SuppliestransactionlistInitial.copyWith();
}

class SuppliestransactionlistLoading extends SuppliestransactionlistState {
  final List<MoneyTransactionModel> transactions;

  SuppliestransactionlistLoading({required this.transactions});
}

class SuppliestransactionlistLoaded extends SuppliestransactionlistState {
  final List<MoneyTransactionModel> transactions;

  SuppliestransactionlistLoaded({required this.transactions});
}

class SuppliestransactionlistError extends SuppliestransactionlistState {
  final String error;

  SuppliestransactionlistError(this.error);
}
