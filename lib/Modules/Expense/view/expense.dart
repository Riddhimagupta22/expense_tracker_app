import 'package:expense_tracker_app/Comman_Wigets/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/expense_controller.dart';
import '../../../Controller/pdf_controller.dart';
import '../../dashboard/view/Widget/transactionlist.dart';

class ExpenseScreen extends StatefulWidget {
ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final expenseController = Get.put(ExpenseController());


  @override
  void initState() {
    super.initState();
    expenseController.fetchExpense();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Column(children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () { Get.to(NavBar());},
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    )),
                Text(
                  "Transaction",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_horiz, size: 28), // Same icon as before
                  onSelected: (value) {
                    if (value == 'export_pdf') {
                      CreatePDF(expenseController.expenseList);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'export_pdf',
                      child: Text('Export to PDF'),
                    ),
                    // You can add more options here
                  ],
                ),

              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(() {
            final items = expenseController.expenseList;
            if (items.isEmpty) {
              return const Center(child: Text("No expenses yet."));
            }
            return ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Transactionlist(expenseModel: items[index]);
              },
            );
          }),
        ],)),
      ),

    );
  }
}
