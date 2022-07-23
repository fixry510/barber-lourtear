import 'package:barber/config/routes.dart';
import 'package:barber/models/hair-data.dart';
import 'package:barber/screens/Customer/Home/hair-item.dart';
import 'package:barber/screens/Customer/Home/home-user-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class HairItems extends StatelessWidget {
  const HairItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeUserController>();
    return PageView.builder(
      controller: homeController.pageController,
      itemCount: homeController.hairs.length,
      itemBuilder: (context, index) {
        HairData hairData = homeController.hairs[index];
        return HairItem(hairData: hairData);
      },
    );
  }
}
