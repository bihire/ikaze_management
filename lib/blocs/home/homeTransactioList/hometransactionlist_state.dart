part of 'hometransactionlist_bloc.dart';

abstract class HometransactionlistState extends Equatable {
  final List<MoneyTransactionModel> transactions;
  final String? error;

  const HometransactionlistState({this.transactions = const [], this.error});

  HometransactionlistState copyWith({
    List<MoneyTransactionModel>? transactions
  }) {
    return HomeTransactionlistLoaded(
      transactions: transactions ?? this.transactions
    );
  }

  @override
  String toString() => 'PostLoaded { posts: ${transactions.length}}';

  @override
  List<Object?> get props => [transactions, error];
}

class HometransactionlistInitial extends HometransactionlistState {
  // HometransactionlistInitial.copyWith();
}

class HomeTransactionlistLoading extends HometransactionlistState {
  final List<MoneyTransactionModel> transactions;

  HomeTransactionlistLoading({ required this.transactions });
}

class HomeTransactionlistLoaded extends HometransactionlistState {
  final List<MoneyTransactionModel> transactions;

  HomeTransactionlistLoaded({ required this.transactions });
}

class HomeTransactionlistError extends HometransactionlistState {
  final String error;

  HomeTransactionlistError(this.error);
}
