import 'package:expense_tracker_app/Comman_Wigets/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/expense_controller.dart';
import '../../Modules/dashboard/view/Widget/transactionlist.dart';

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
                  "Expense",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 28,
                    )),
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
