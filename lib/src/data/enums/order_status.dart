enum OrderStatus {
  delivered("Delivered"),
  canceled("Canceled"),
  pending("Pending"),
  unknown("Unknown");

  final String dbValue;
  const OrderStatus(this.dbValue);

  static OrderStatus fromDBValue(String val) {
    if (val == "Delivered") {
      return delivered;
    } else if (val == "Canceled") {
      return canceled;
    } else if (val == "Pending") {
      return pending;
    } else {
      return unknown;
    }
  }
}
