
import 'package:inventory_controller/models/homePage/overal_weekly_model.dart';

class DetailOveralWeeklyAction {}

class DetailOveralWeeklyLoadedAction {
  DetailOveralWeeklyLoadedAction(this.overalWeekly);

  final List<OveralWeeklyTransactionModel> overalWeekly;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}