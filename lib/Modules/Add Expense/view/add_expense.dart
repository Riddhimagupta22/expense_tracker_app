import 'package:expense_tracker_app/Comman_Wigets/widget/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Comman_Wigets/widget/custom Container/custom_container.dart';
import 'widget/custom_textfield.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _amountController = TextEditingController();
  final _notetController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var isLoading = false;

  final _dateController = TextEditingController();
  String? _isEmptyCheck(value) {
    if (value!.isEmpty) {
      return 'Please enter the details';
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user = FirebaseAuth.instance.currentUser;
      // var data = {
      //   "username": _userNameController.text,
      //   "email": _EmailController.text,
      //   "password": _PasswordController.text,
      //   "Phone Number": _PhonenumberController.text,
      // };
      // await authService.CreateUser(data, context);
      // setState(() {
      //   isLoading = false;
      // });
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
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(NavBar());
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                        Text(
                          "Add Expense",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              size: 28,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 165,
            left: 40,
            child: Container(
              height: 600,
              width: 358,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 45),
                    CustomTextfield(),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: _isEmptyCheck,
                        controller: _amountController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Amount',
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(221, 221, 221, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(67, 136, 131, 1))),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        width: 318,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(221, 221, 221, 1)),
                        ),
                        child: DropdownButton<String>(
                          value: "Expense",
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                          onChanged: (value) {},
                          items: ["Expense", "Income"]
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: _isEmptyCheck,
                        keyboardType: TextInputType.number,
                        controller: _dateController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Date',
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(221, 221, 221, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(67, 136, 131, 1))),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _notetController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Note',
                          labelStyle: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(221, 221, 221, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(67, 136, 131, 1))),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        if (isLoading == false) {
                          _submitForm();
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(67, 136, 131, 1)),
                        alignment: Alignment.center,
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "Save",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
