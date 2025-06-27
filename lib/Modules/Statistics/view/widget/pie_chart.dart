import 'package:expense_tracker_app/Controller/analytics_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Piechart extends StatelessWidget {
  Piechart({super.key});

  @override
  Widget build(BuildContext context) {

    final AnalyticsController _analyticsController = Get.find<AnalyticsController>();

    return Obx(() {
      final selectedType = _analyticsController.selectedType.value;


      if (selectedType.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: const Center(child: Text("Please select a type.")),
        );
      }

      final chartData = selectedType == 'Income'
          ? _analyticsController.incomeData
          : _analyticsController.expenseData;

      if (chartData.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: const Center(child: Text("No data available.")),
        );
      }

      final colors = [
        Colors.blue,
        Colors.green,
        Colors.orange,

      ];

      return Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: SizedBox(
          height: 240,
          child: PieChart(
            PieChartData(
              sections: chartData.entries.toList().asMap().entries.map((entry) {
                final index = entry.key;
                final data = entry.value;

                return PieChartSectionData(
                  value: data.value,
                  title: "Rs ${data.value.toStringAsFixed(0)}\n${data.key}",
                  color: colors[index % colors.length],
                  radius: 120,
                  titleStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),

            ),
          ),
        ),
      );
    });
  }
}
