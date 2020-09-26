
class LoadDashboardDailyTotalAction {}

class DashboardDailyTotalLoadedAction {
  DashboardDailyTotalLoadedAction(this.dashboardDailyTotal);

  final String dashboardDailyTotal;
}

class ErrorOccurredAction {
  ErrorOccurredAction(this.exception);

  final Exception exception;
}

class ErrorHandledAction {}
