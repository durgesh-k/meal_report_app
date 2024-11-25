import 'package:canteen_meal_report/src/data/models/report/report_data_model.dart';
import 'package:canteen_meal_report/src/data/models/report/report_summary_model.dart';
import 'package:canteen_meal_report/src/presentation/screens/home/widgets/report_summary_widget.dart';
import 'package:canteen_meal_report/src/presentation/widgets/report_card.dart';
import 'package:flutter/material.dart';

class ReportListWidget extends StatelessWidget {
  const ReportListWidget(
      {super.key,
      required this.reports,
      required this.showReport,
      this.summary});
  final List<OrderReport> reports;
  final bool showReport;
  final ReportSummary? summary;

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: reports.length,
      itemBuilder: (context, index, animation) {
        if (showReport) {
          if (index == 0) {
            return ReportSummaryWidget(summary: summary!);
          }
          OrderReport report = reports[index - 1];
          return ReportCard(
            report: report,
            animation: animation,
          );
        } else {
          OrderReport report = reports[index];
          return ReportCard(report: report, animation: animation);
        }
      },
    );
  }
}
