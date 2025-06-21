import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Comman_Wigets/widget/bottom_nav.dart';
import 'doc_data.dart';


class AuthService {
  var docdata = DocData();
   CreateUser( data,context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );
      await docdata.addUser(data);
      Get.off(NavBar());
      print("✅ User created: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User created successfully!"), backgroundColor: Colors.green),
      );
    }  catch (e) {
      print("Unexpected error: $e");
    }
  }

   login(data,context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );
      Get.off(NavBar());
      await docdata.addUser(data);
      print("✅ Login successful: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!"), backgroundColor: Colors.green),
      );
    } catch (e) {
      print("Unexpected login error: $e");
    }
  }
}
