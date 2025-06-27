import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Controller/analytics_controller.dart';

class DropMenu extends StatelessWidget {
  DropMenu({super.key});

  final analyticsController = Get.find<AnalyticsController>();

  final List<String> transactionTypes = ["Expense", "Income"];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedType = analyticsController.selectedType.value;

      return DropdownButton<String>(
        value: selectedType.isEmpty ? null : selectedType,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        hint: Text(
          "Select Type",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(102, 102, 102, 1),
          ),
        ),
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(102, 102, 102, 1),
        ),
        onChanged: (value) {
          if (value != null && transactionTypes.contains(value)) {
            analyticsController.selectedType.value = value;
          }
        },
        items: transactionTypes.map((type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(type),
          );
        }).toList(),
      );
    });
  }
}
