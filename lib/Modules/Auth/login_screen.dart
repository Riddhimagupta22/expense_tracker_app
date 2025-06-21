import 'package:expense_tracker_app/Modules/Auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/auth_controller.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _authController.formKey,
            child: Column(
              children: [
                SizedBox(height: 240),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      "Login Account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _authController.emailController,
                  validator: _authController.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(67, 136, 131, 1))),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _authController.PasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Please enter atleast 6 digit password';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(67, 136, 131, 1))),
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      _authController.isLoading.value
                          ? print("Loading")
                          : _authController.submitLoginForm(context);
                    },
                    child: _authController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Log In",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () => Get.to(SignupScreen()),
                  child: Text(
                    "Create a new Account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.teal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
