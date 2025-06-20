import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 200,
        width: 380,
        decoration: BoxDecoration(
            boxShadow:  [BoxShadow(color: Color.fromRGBO(47, 125, 121, 0.3),
                offset:Offset(0,6),
                blurRadius: 12,
                spreadRadius: 6)],
            color: Color.fromRGBO(47, 126, 121, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Balance",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "\$ 2,548.00",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor:
                      Color.fromRGBO(255, 255, 255, 0.15),
                      child: Icon(Icons.arrow_downward,
                          color: Colors.white, size: 19),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Income",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(208, 229, 228, 1),
                      ),
                    ),
                  ]),
                  Row(children: [
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor:
                      Color.fromRGBO(255, 255, 255, 0.15),
                      child: Icon(Icons.arrow_downward,
                          color: Colors.white, size: 19),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Expenses",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(208, 229, 228, 1),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ 1,840.00",style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -1
                  ),),
                  Text("\$ 284.00",style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -1
                  ),)
                ],
              ),
            )
          ],
        ),
      );
    }
  }
