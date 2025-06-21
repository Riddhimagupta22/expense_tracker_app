
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List data = ["Day", "Week", "Month", "Year"];
  var colour = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    )),
                Text(
                  "Statistics",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cloud_download,
                      size: 28,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colour = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colour == index
                            ? Color.fromRGBO(67, 136, 131, 1)
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
                                : Color.fromRGBO(102, 102, 102, 1)),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0,left:270,right: 15),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(102, 102, 102, 1)),
              ),
              child: DropdownButton<String>(
                value: "Expense",
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
                onChanged: (value) {

                },
                items: ["Expense", "Income"]
                    .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
              ),
            ),
          ),
          // PieChart(PieChartData(
          //
          // ),
          // duration: Duration(milliseconds: 50),
          // curve: Curves.linear,)
        ],
      ))),
    );
  }
}
