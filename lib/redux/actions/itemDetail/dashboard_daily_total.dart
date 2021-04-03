
class DetailDailySumAction {
  DetailDailySumAction(this.productId);

  final String productId;
}

class DetailDailySumLoadedAction {
  DetailDailySumLoadedAction(this.detailDailyTotal);

  final String detailDailyTotal;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
