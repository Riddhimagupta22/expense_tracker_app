import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Comman_Wigets/widget/bottom_nav.dart';


class AuthService {
   CreateUser( data,context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );
      Get.to(NavBar());
      print("✅ User created: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User created successfully!"), backgroundColor: Colors.green),
      );
    } on FirebaseAuthException catch (e) {
      print("Signup error: ${e.code} - ${e.message}");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Signup Failed"),
          content: Text(e.message ?? "An unknown error occurred."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

   login(data,context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );
      Get.to(NavBar());
      print("✅ Login successful: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!"), backgroundColor: Colors.green),
      );
    } on FirebaseAuthException catch (e) {
      print("Login error: ${e.code} - ${e.message}");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Login Failed"),
          content: Text(e.message ?? "An unknown error occurred."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    } catch (e) {
      print("Unexpected login error: $e");
    }
  }
}
