import 'package:expense_tracker_app/Controller/analytics_controller.dart';
import 'package:expense_tracker_app/Modules/Statistics/view/widget/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/drop_menu.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final AnalyticsController analyticsController = Get.find<AnalyticsController>();
  List data = ["Day", "Week", "Month", "Year"];
  var colour = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
                    ),
                    Text(
                      "Statistics",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cloud_download, size: 28),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          colour = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colour == index
                              ? const Color.fromRGBO(67, 136, 131, 1)
                              : Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          data[index],
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: colour == index
                                ? Colors.white
                                : const Color.fromRGBO(102, 102, 102, 1),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 17.0, left: 200, right: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 40,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromRGBO(221, 221, 221, 1)),
                  ),
                  child: DropMenu(),
                ),
              ),
              SizedBox(height: 40,),


              Piechart(),
            ],
          ),
        ),
      ),
    );
  }
}
