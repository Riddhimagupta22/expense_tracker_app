import 'package:expense_tracker_app/Modules/Auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _EmailController = TextEditingController();

  final _PasswordController = TextEditingController();

  var authService = AuthService();

  var isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var data = {

        "email": _EmailController.text,
        "password": _PasswordController.text,

      };
      await authService.login(data, context);
      setState(() {
        isLoading = false;
      });
      // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
      //     SnackBar(content: Text('Sign Up is done successfully'))
      // );
    }
  }

  String? _validateEmail(value){
    if(value!.isEmpty){
      return 'Please enter an Email';
    }
    RegExp emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if(!emailExp.hasMatch(value)){
      return 'Please enter a valid Email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
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
                  controller: _EmailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 16),
                TextFormField(
                  controller: _PasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter a password';
                    }
                    if(value.length  < 6){
                      return 'Please enter atleast 6 digit password';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                    onPressed:(){ isLoading ? print("Loading") : _submitForm();} ,
                    child: isLoading
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
                SizedBox(
                    height: 30),

                TextButton(onPressed: () => Get.to(SignupScreen()), child:  Text(
                  "Create a new Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.teal
                  ),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
