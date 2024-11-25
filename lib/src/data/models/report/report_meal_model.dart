import 'package:canteen_meal_report/src/data/enums/order_status.dart';

class ReportMealModel {
  final OrderStatus breakfast;
  final OrderStatus lunch;
  final OrderStatus dinner;

  ReportMealModel({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory ReportMealModel.fromJson(Map<String, dynamic> json) {
    return ReportMealModel(
      breakfast: OrderStatus.fromDBValue(json['breakfast'] ?? ""),
      lunch: OrderStatus.fromDBValue(json['lunch'] ?? ""),
      dinner: OrderStatus.fromDBValue(json['dinner'] ?? ""),
    );
  }
}
