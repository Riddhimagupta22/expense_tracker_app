import 'package:expense_tracker_app/Modules/dashboard/view/Widget/head_widget.dart';
import 'package:expense_tracker_app/Modules/dashboard/view/Widget/transactionlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Comman_Wigets/widget/custom Container/custom_container.dart';
import '../../Add Expense/view/add_expense.dart';
import 'Widget/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final List transaction = [
      {
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      }, {
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      }, {
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      }, {
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      }, {
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      },{
        'image': "",
        'title': "Upwork",
        'subtitle': "Today",
        'amount': "+ \$ 850.00",
        'amountcolor': Colors.green,
      },

    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomContainer(
                    child: HeadWidget(),
                  ),
                  SizedBox(height: 80),
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
                        Text(
                          "See all",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(102, 102, 102, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transaction.length,
                    itemBuilder: (context, index) {
                      final item = transaction[index];
                      return Transactionlist(
                        image: item['image'],
                        title: item['title'],
                        subtitle: item['subtitle'],
                        amount: item['amount'],
                        amountColor: item['amountcolor'],
                      );
                    },
                  ),
                ],
              ),


              Positioned(
                top: 700,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(AddExpense());
                  },
                  backgroundColor: Color.fromRGBO(67, 136, 131, 1),
                  child: Icon(Icons.add_rounded,color: Colors.white,size: 25,),
                ),
              ),

              Positioned(
                top: 150,
                left: 32,
                child: CustomCard(userId: userId,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
