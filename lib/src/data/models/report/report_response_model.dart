import 'package:canteen_meal_report/src/data/models/report/report_data_model.dart';
import 'package:canteen_meal_report/src/data/models/user/user_model.dart';

class ReportResponse {
  final UserModel user;
  final List<OrderReport> reports;

  ReportResponse({
    required this.user,
    required this.reports,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
      user: UserModel.fromJson(json['user']),
      reports: (json['reports'] as List)
          .map((reportJson) => OrderReport.fromJson(reportJson))
          .toList(),
    );
  }
}
