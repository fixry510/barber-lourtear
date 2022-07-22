import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeUserController extends GetxController {
  PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  double currentPage = 0.0;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(listernerPageView);
  }

  void listernerPageView() {
    currentPage = pageController.page!;
    update(["scroll"]);
  }

  List hairs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
  ];

  @override
  void onClose() {
    pageController.removeListener(listernerPageView);
    super.onClose();
  }
}
