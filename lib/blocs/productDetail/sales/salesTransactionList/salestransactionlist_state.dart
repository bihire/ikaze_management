part of 'salestransactionlist_bloc.dart';

abstract class SalestransactionlistState extends Equatable {
  final List<MoneyTransactionModel> transactions;
  final String? error;

  SalestransactionlistState({this.transactions = const [], this.error});

  SalestransactionlistState copyWith({
    List<MoneyTransactionModel>? transactions,
    // bool hasReachedMax,
  }) {
    return SalestransactionlistLoaded(
      transactions: transactions ?? this.transactions,
      // hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() => 'PostLoaded { posts: ${transactions.length}}';

  @override
  List<Object?> get props => [transactions, error];
}

class SalestransactionlistInitial extends SalestransactionlistState {
  // SalestransactionlistInitial.copyWith();
}

class SalestransactionlistLoading extends SalestransactionlistState {
  final List<MoneyTransactionModel> transactions;

  SalestransactionlistLoading({required this.transactions});
}

class SalestransactionlistLoaded extends SalestransactionlistState {
  final List<MoneyTransactionModel> transactions;

  SalestransactionlistLoaded({required this.transactions});
}

class SalestransactionlistError extends SalestransactionlistState {
  final String? error;

  SalestransactionlistError(this.error);
}
