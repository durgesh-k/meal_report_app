import 'package:canteen_meal_report/src/data/models/report/report_meal_model.dart';

class OrderReport {
  final String date;
  final ReportMealModel? mealStatus;

  OrderReport({
    required this.date,
    required this.mealStatus,
  });

  factory OrderReport.fromJson(Map<String, dynamic> json) {
    return OrderReport(
      date: json['date'] ?? '',
      mealStatus: parseOptIns(json['opt_ins']),
    );
  }

  static ReportMealModel? parseOptIns(dynamic rawOptIns) {
    if (rawOptIns == null) return null;
    if (rawOptIns is Map<String, dynamic>?) {
      return ReportMealModel.fromJson(rawOptIns as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  /* static Map<String, String> mealStatusToJsonMap(Map<String, OrderStatus> optIns) {
    return optIns.map(
      (key, value) => MapEntry(key, value.toDbValue()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'opt_ins': toJsonMap(mealStatus),
    };
  } */
}
