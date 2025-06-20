import 'package:expense_tracker_app/Modules/dashboard/view/Widget/head_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Comman_Wigets/widget/custom Container/custom_container.dart';
import 'Widget/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomContainer(
                    child: HeadWidget(),
                  ),
                ],
              ),
              Positioned(
                top: 150,
                left: 32,
                child: CustomCard(),
              )
            ],
          ),
      ),
    );
  }
}