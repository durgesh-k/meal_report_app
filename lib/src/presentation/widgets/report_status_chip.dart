import 'package:canteen_meal_report/gen/colors.gen.dart';
import 'package:canteen_meal_report/src/data/enums/order_status.dart';
import 'package:canteen_meal_report/src/domain/utils/size_config.dart';
import 'package:flutter/material.dart';

class ReportStatusChip extends StatelessWidget {
  const ReportStatusChip({super.key, required this.meal, required this.status});
  final String meal;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    Color containerColor = ColorName.white;
    if (status == OrderStatus.delivered) {
      containerColor = Colors.green.withOpacity(0.2);
    } else if (status == OrderStatus.canceled) {
      containerColor = Colors.blue.withOpacity(0.2);
    } else {
      containerColor = Colors.red.withOpacity(0.2);
    }
    return Container(
      height: SizeConfig.height * 0.09,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal,
              style: const TextStyle(
                  fontSize: 18,
                  color: ColorName.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(status.dbValue),
          ],
        ),
      ),
    );
  }
}
