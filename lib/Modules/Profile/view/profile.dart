import 'package:expense_tracker_app/Comman_Wigets/widget/custom%20Container/custom_container.dart';
import 'package:expense_tracker_app/Modules/Profile/view/widgets/cricular_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Comman_Wigets/widget/bottom_nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Column(
            children: [
              CustomContainer(child: Column(
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
                        "Profile",
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
              ),),

              const CircularImage(image: 'Assets/Image/hand-drawn-ethnic-beauty-illustration.png',)

            ],
          ),
        ],
      )),
    );
  }
}
