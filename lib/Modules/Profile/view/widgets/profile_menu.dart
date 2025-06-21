import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileMenu({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(icon, color: Color.fromRGBO(102, 102, 102, 1)),
        title: Text(
          title,
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        onTap: () {});
  }
}
