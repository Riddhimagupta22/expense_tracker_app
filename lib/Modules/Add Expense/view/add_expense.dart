import 'package:expense_tracker_app/Comman_Wigets/widget/bottom_nav.dart';
import 'package:expense_tracker_app/Model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Comman_Wigets/widget/custom Container/custom_container.dart';
import '../../../Controller/expense_controller.dart';
import 'widget/custom_textfield.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  final _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _expenseController = Get.put(ExpenseController());

  bool isLoading = false;
  String? _selectedCategory;
  String _selectedType = "Expense";

  String? _isEmptyCheck(value) {
    if (value!.isEmpty) return 'Please enter the details';
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      setState(() => isLoading = true);

      final expense = ExpenseModel(
        item: _selectedCategory!,
        amount: int.parse(_amountController.text),
        date: DateFormat.yMMMMd().parse(_dateController.text),
        type: _selectedType,
        note: _noteController.text,
      );

      await _expenseController.addExpense(expense);
      setState(() => isLoading = false);
      Get.offAll(NavBar());
    } else if (_selectedCategory == null) {
      Get.snackbar("Missing Category", "Please select a category.",
          backgroundColor: Colors.red.shade100, colorText: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomContainer(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.to(NavBar()),
                            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                                size: 20, color: Colors.white),
                          ),
                          Text("Add Transaction",
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz,
                                size: 28, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 140,
              left: 30,
              child: Container(
                height: 530,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // soft grey shadow
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 4), // moves shadow downwards
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      CustomTextfield(
                        onChanged: (value) => _selectedCategory = value,
                      ),
                      const SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          validator: _isEmptyCheck,
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Amount',
                            labelStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(102, 102, 102, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(221, 221, 221, 1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(67, 136, 131, 1))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 45,
                          width: 318,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(221, 221, 221, 1)),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedType,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedType = value!;
                              });
                            },
                            items: ["Expense", "Income"]
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            var datepicked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1999),
                              lastDate: DateTime(3000),
                            );
                            if (datepicked != null) {
                              _dateController.text =
                                  DateFormat.yMMMMd().format(datepicked);
                              setState(() {});
                            }
                          },
                          validator: _isEmptyCheck,
                          controller: _dateController,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color.fromRGBO(136, 136, 136, 1),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Date',
                            labelStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(102, 102, 102, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(221, 221, 221, 1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(67, 136, 131, 1))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Note',
                            labelStyle: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(102, 102, 102, 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(221, 221, 221, 1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(67, 136, 131, 1))),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),


                      GestureDetector(
                        onTap: isLoading ? null : _submitForm,
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(67, 136, 131, 1)),
                          alignment: Alignment.center,
                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.white))
                              : Text("Save",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
