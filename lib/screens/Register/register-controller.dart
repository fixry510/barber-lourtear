import 'dart:io';

import 'package:barber/config/api-endpoint.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:barber/screens/auth-controller.dart';
import 'package:barber/utils/load-request.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  File? file;

  Future<void> onPickImage() async {
    final ImagePicker _picker = ImagePicker();
    final xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      file = File(xFile.path);
      update();
    }
  }

  Future<void> onRegister() async {
    // perform otp validation
    await loadRequest(() async {
      try {
        final fbAuth = FirebaseAuth.instance;
        final credential = await fbAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await fromDataRequest(
          path: "${APIEndpoint.hostName}/register-user",
          data: dio.FormData.fromMap({
            "user_id": credential.user!.uid,
            "email": emailController.text.trim(),
            "fullName": fullNameController.text,
            "phoneNumber": phoneController.text,
            "position": 1,
            "image": await dio.MultipartFile.fromFile(
              file!.path,
              filename: 'profile-image.png',
            ),
          }),
        );
        Get.find<AuthController>().isLogin.value = true;
      } on RequestException catch (_) {
        Get.showSnackbar(GetSnackBar(
          title: "เกิดข้อผิดพลาด",
          message: "เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง",
        ));
      }
    });
  }
}
