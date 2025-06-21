import 'package:expense_tracker_app/Expense/view/expense.dart';
import 'package:expense_tracker_app/Modules/dashboard/view/Widget/head_widget.dart';
import 'package:expense_tracker_app/Modules/dashboard/view/Widget/transactionlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Comman_Wigets/widget/custom Container/custom_container.dart';
import '../../../Controller/expense_controller.dart';
import '../../../Model/expense_model.dart';
import '../../Add Expense/view/add_expense.dart';
import 'Widget/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final expenseController = Get.put(ExpenseController());


  @override
  void initState() {
    super.initState();
    expenseController.fetchExpense();
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddExpense());
        },
        backgroundColor: const Color.fromRGBO(67, 136, 131, 1),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 25),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomContainer(
                    child: HeadWidget(),
                  ),
                  const SizedBox(height: 100),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions history",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(onPressed: (){Get.to(ExpenseScreen());}, child: Text(
                          "See all",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(102, 102, 102, 1),
                          ),
                        ),)
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
                  const SizedBox(height: 100),
                ],
              ),
              Positioned(
                top: 150,
                left: 32,
                child: card(userId: userId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
