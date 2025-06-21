import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final PhoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();

  final isLoading = false.obs;

  final authService = AuthService();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter an Email';
    RegExp emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailExp.hasMatch(value) ? null : 'Please enter a valid Email';
  }

  Future<void> submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final data = {
        "username": userNameController.text,
        "email": emailController.text,
        "password": PasswordController.text,
        "Phone Number": PhoneNumberController.text,
      };
      await authService.CreateUser(data, context);
      isLoading.value = false;
    }
  }

  Future<void> submitLoginForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final data = {
        "email": emailController.text,
        "password": PasswordController.text,
      };
      await authService.login(data, context);
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    PhoneNumberController.dispose();
    emailController.dispose();
    PasswordController.dispose();
    super.onClose();
  }
}
