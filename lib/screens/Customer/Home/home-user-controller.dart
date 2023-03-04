import 'package:barber/config/api-endpoint.dart';
import 'package:barber/models/hair-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUserController extends GetxController {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  PageController pageController = PageController(viewportFraction: 0.9);
  List<HairData> hairs = [];

  List historyData = [];

  PageController pageSwapHistory = PageController();

  final isLoad = true.obs;

  Future<void> fetchHairs() async {
    try {
      final data = await getRequest(path: "${APIEndpoint.hostName}/hairs");
      data.forEach((hairItem) {
        hairs.add(HairData.fromJson(hairItem));
      });
    } on RequestException catch (_) {}
  }

  Future<void> fetchHistory() async {
    try {
      final userData = Get.find<UserData>().userId;
      final data = await getRequest(
          path: "${APIEndpoint.hostName}/user/history/${userData}");
      historyData = data;
    } on RequestException catch (_) {
    } finally {
      isLoad.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchHairs().then((_) {
      fetchHistory();
    });
  }
}
