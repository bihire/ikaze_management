
import 'package:inventory_controller/models/homePage/overal_monthly_model.dart';

class DetailOveralMonthlyAction {}

class DetailOveralMonthlyLoadedAction {
  DetailOveralMonthlyLoadedAction(this.overalMonthly);

  final List<OveralMonthlyTransactionModel> overalMonthly;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}