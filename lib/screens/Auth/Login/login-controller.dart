import 'package:barber/screens/auth-controller.dart';
import 'package:barber/utils/load-request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onLogin() async {
    await loadRequest(() async {
      final fbAuth = FirebaseAuth.instance;
      await fbAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.find<AuthController>().isLogin.value = true;
    }, Colors.black45);
  }
}
