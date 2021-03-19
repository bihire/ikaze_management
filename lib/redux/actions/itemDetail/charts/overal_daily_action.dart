
import 'package:inventory_controller/models/homePage/overal_daily_model.dart';

class DetailOvaralDailyAction {}

class DetailOvaralDailyLoadedAction {
  DetailOvaralDailyLoadedAction(this.overalDaily);

  final List<OveralDailyTransactionModel> overalDaily;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}