import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactionlist extends StatelessWidget {
  final String image, title, subtitle, amount;
  final Color amountColor;
  const Transactionlist(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.amount,
      required this.amountColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image,height: 50,),
      ),
      title:  Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      subtitle:  Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(102, 102, 102, 1),
        ),
      ),
      trailing: Text(
        amount,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: amountColor,
        ),
      ),
    );
  }
}
