import 'package:canteen_meal_report/gen/colors.gen.dart';
import 'package:canteen_meal_report/src/data/models/report/report_summary_model.dart';
import 'package:flutter/material.dart';

class ReportSummaryWidget extends StatelessWidget {
  const ReportSummaryWidget({super.key, required this.summary});
  final ReportSummary summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Report",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Row(
          children: [
            const Text("Total Ordered: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text((summary.totalOrders).toString(),
                style: const TextStyle(fontSize: 18))
          ],
        ),
        Row(
          children: [
            const Text("Total Delivered: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text((summary.totalDelivered).toString(),
                style: const TextStyle(fontSize: 18))
          ],
        ),
        Row(
          children: [
            const Text("Total Canceled: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text((summary.totalCanceled).toString(),
                style: const TextStyle(fontSize: 18))
          ],
        ),
        Row(
          children: [
            const Text("Total Pending: ",
                style: TextStyle(
                    color: ColorName.error,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text((summary.totalPending).toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: ColorName.error,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text("Total Fine: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorName.error,
                    fontSize: 18)),
            Column(
              children: [
                Text("${(summary.totalFine)} (100 x ${summary.totalPending})",
                    style:
                        const TextStyle(color: ColorName.error, fontSize: 18)),
              ],
            )
          ],
        )
      ]),
    );
  }
}
