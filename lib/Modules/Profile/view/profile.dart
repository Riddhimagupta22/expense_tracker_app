import 'package:expense_tracker_app/Comman_Wigets/widget/custom%20Container/custom_container.dart';
import 'package:expense_tracker_app/Modules/Profile/view/widgets/cricular_widget.dart';
import 'package:expense_tracker_app/Modules/Profile/view/widgets/profile_menu.dart';
import 'package:expense_tracker_app/Modules/Profile/view/widgets/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Comman_Wigets/widget/bottom_nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                            onPressed: () {
                              Get.to(NavBar());
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
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
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: ListView(
                      children: const [
                        SizedBox(height: 50),
                        ProfileMenu(title: "Invite Friends", icon: Icons.person_add_alt_1),
                        ProfileMenu(title: "Account Info", icon: Icons.account_circle),
                        ProfileMenu(title: "Personal Profile", icon: Icons.person_outline),
                        ProfileMenu(title: "Message Center", icon: Icons.message),
                        ProfileMenu(title: "Login & Security", icon: Icons.security),
                        ProfileMenu(title: "Data and Privacy", icon: Icons.lock),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 170,
              left: 110,
              child: UserDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
