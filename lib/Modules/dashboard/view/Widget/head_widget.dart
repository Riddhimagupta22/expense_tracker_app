import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 50,
            left: 388,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 40,
                width: 40,
                color: const Color.fromRGBO(255, 255, 255, 0.06),
                child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good afternoon,",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Enjelin Morgeana",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      );
    }
  }
