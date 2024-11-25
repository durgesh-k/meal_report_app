import 'package:canteen_meal_report/src/data/models/report/report_data_model.dart';
import 'package:canteen_meal_report/src/domain/utils/app_utils.dart';
import 'package:canteen_meal_report/src/presentation/widgets/report_status_chip.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatefulWidget {
  final OrderReport report;
  final Animation<double> animation;

  const ReportCard({required this.report, required this.animation});

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(widget.animation),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Utils.formatDate(widget.report.date),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  if (widget.report.mealStatus != null)
                    Row(
                      children: [
                        Expanded(
                          child: ReportStatusChip(
                              meal: "Breakfast",
                              status: widget.report.mealStatus!.breakfast),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ReportStatusChip(
                              meal: "Lunch",
                              status: widget.report.mealStatus!.lunch),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ReportStatusChip(
                              meal: "Dinner",
                              status: widget.report.mealStatus!.dinner),
                        ),
                      ],
                    )
                  else
                    const Text("No data")
                ],
              ),
            ),
          ),
        ));
  }
}
