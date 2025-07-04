import 'package:expense_tracker_app/Model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  final ExpenseModel expenseModel;

  const Transactionlist({
    super.key,
    required this.expenseModel,
  });

  @override
  Widget build(BuildContext context) {
    
    final formattedDate = DateFormat('dd MMM, yyyy').format(expenseModel.date);

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          expenseModel.type == 'Expense'
              ? 'Assets/Image/expense_11442705-removebg-preview.png'
              : 'Assets/Image/capital-gain_18096481-removebg-preview.png',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),

      title: Text(
        expenseModel.item,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        formattedDate,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(102, 102, 102, 1),
        ),
      ),
      trailing: Text(
        "Rs ${expenseModel.amount.toStringAsFixed(2)}",
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: expenseModel.type == 'Expense' ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
