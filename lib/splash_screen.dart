import 'package:expense_tracker_app/Modules/Auth/signup_screen.dart';
import 'package:expense_tracker_app/Modules/onBoarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash  extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 6),(){
      Get.off(SignupScreen());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF429690),
                          Color(0xFF2A7C76),
                        ]),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Text(
                    "mono",

                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                      color: Colors.white,

                  ),
                ),)

    );
  }
}
