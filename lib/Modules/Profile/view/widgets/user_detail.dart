import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cricular_widget.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid;
    final email = currentUser?.email ?? 'Email not available';

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const SizedBox(); 
    }

    if (!snapshot.hasData || !snapshot.data!.exists) {
    return const Text("Hello, User", style: TextStyle(color: Colors.white));
    }

    final userData = snapshot.data!.data() as Map<String, dynamic>;
    final username = userData['username'] ?? 'User';
    {
        return Column(
          children: [
            const CircularImage(
              image: 'Assets/Image/hand-drawn-ethnic-beauty-illustration.png',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
    username,
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
                email,
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(67, 136, 131, 1))),

          ],
        );
      }}
    );
  }
}
