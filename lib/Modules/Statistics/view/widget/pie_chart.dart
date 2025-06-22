import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Piechart extends StatefulWidget {
  const Piechart({super.key, this.data});

  final data;

  @override
  State<Piechart> createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:50.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PieChart(
          swapAnimationDuration: const Duration(milliseconds: 300),
          PieChartData(
            sections: [
              PieChartSectionData(
                value: 20,
                color: Colors.red,
                radius: 100,

              ),PieChartSectionData(

                value: 20,
                color: Colors.green,
                radius: 100,


              ),PieChartSectionData(
                value: 20,
                color: Colors.grey,radius: 100,


              ),
            ],
          ),
        ),
      ),
    );
  }
}
