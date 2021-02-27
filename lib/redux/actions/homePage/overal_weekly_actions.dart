
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';

class LoadOveralWeeklyAction {}

class OveralWeeklyLoadedAction {
  OveralWeeklyLoadedAction(this.overalWeekly);

  final List<OveralWeeklyTransactionModel> overalWeekly;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}