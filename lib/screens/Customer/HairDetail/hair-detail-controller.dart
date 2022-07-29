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

  var selectTechnicData = {}.obs;

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

  // Get.find<HairDetailController>()
  //                                             .selectTechnicData['technic'] =
  //                                         techic;
  //                                     Get.find<HairDetailController>()
  //                                             .selectTechnicData['time'] =
  //                                         value['time'];
  //                                     Get.find<HairDetailController>()
  //                                             .selectTechnicData['date'] =
  //                                         value['date'];
  get getSelectTecnic => {
        "time": selectTechnicData['time'],
        "technic": selectTechnicData['technic'],
        "date": selectTechnicData['date'],
        "hairData": hairData,
      };
}
