class ReportSummary {
  int totalOrders;
  int totalDelivered;
  int totalCanceled;
  int totalPending;
  int totalFine;

  ReportSummary({
    required this.totalOrders,
    required this.totalDelivered,
    required this.totalCanceled,
    required this.totalPending,
    required this.totalFine,
  });

  incrementDelivered() {
    totalDelivered += 1;
  }

  incrementCanceled() {
    totalCanceled += 1;
  }

  incrementPending() {
    totalPending += 1;
  }

  incrementOrdered() {
    totalOrders += 3;
  }

  incrementFine() {
    totalFine += 100;
  }

  static ReportSummary zero() => ReportSummary(
      totalOrders: 0,
      totalDelivered: 0,
      totalCanceled: 0,
      totalPending: 0,
      totalFine: 0);
}
