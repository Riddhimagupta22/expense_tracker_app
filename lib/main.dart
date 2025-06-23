import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'Controller/analytics_controller.dart';
import 'Controller/auth_controller.dart';
import 'Controller/expense_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );


  Get.put(ExpenseController());
  Get.put(AuthController());
  Get.put(AnalyticsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(84, 153, 148, 1)),
      ),
      home: const Splash(),
    );
  }
}
