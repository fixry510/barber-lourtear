import 'package:barber/models/hair-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HairDetailController extends GetxController {
  final currentSelectImage = 0.obs;
  late HairData hairData = Get.arguments;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final hairCutController = TextEditingController();
  final techController = TextEditingController();
  final dateTimeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final userData = Get.find<UserData>();
    emailController.text = userData.email;
    phoneController.text = userData.phoneNumber;
    hairCutController.text = hairData.name;
  }

  void onChangeSelectImage(index) {
    currentSelectImage.value = index;
  }
}