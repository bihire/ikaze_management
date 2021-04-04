
class DetailDailySumAction {
  DetailDailySumAction(this.productId);

  final String productId;
}

class DetailDailySumLoadedAction {
  DetailDailySumLoadedAction(this.detailDailyTotal);

  final String detailDailyTotal;
}

class ErrorDetailDailyOccurredAction {
  ErrorDetailDailyOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
