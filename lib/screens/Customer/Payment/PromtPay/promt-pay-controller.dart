import 'dart:async';

import 'package:barber/config/api-endpoint.dart';
import 'package:barber/config/routes.dart';
import 'package:barber/models/promt-pay-data.dart';
import 'package:barber/models/technic-time-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail-controller.dart';
import 'package:barber/screens/Customer/Payment/payment-success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromtPayController extends GetxController {
  StreamSubscription? subscription;
  var isLoad = true.obs;

  PromtPayData? prompayData;
  final userController = Get.find<UserData>();
  final hairDetail = Get.find<HairDetailController>();

  subscribeFireStore() {
    subscription = FirebaseFirestore.instance
        .collection("payment")
        .doc(prompayData!.doc)
        .snapshots()
        .listen((doc) async {
      if (doc.data()?['status'] == "successful") {
        await Get.dialog(
          PaymentSuccess(),
          barrierColor: Colors.black45,
        );
        Future.delayed(300.milliseconds, () {
          Get.offNamedUntil(
            Routes.paymentSummary,
            ModalRoute.withName(Routes.homeUser),
            arguments: Get.find<HairDetailController>().getSelectTecnic,
          );
        });
      }
    });
  }

  Future<void> test() async {
    postRequest(path: "${APIEndpoint.hostName}/hook", data: {
      "data": {
        "id": prompayData!.doc,
        "status": "successful",
      },
    });
  }

  Future<void> generatePromtpay() async {
    try {
      final data =
          await postRequest(path: "${APIEndpoint.hostName}/promtpay", data: {
        "userId": userController.userId,
        "price": "${hairDetail.hairData.price}00",
        "technicId": hairDetail.selectTechnicData['technic'].userId,
        "scheduleId": (hairDetail.selectTechnicData['time'] as TechnicTimeData)
            .scheduleId,
        "hairId": hairDetail.hairData.hairId,
        "dateReserve":
            hairDetail.selectTechnicData['date'].split("/").reversed.join("-"),
        "reserveData": {
          "email": hairDetail.emailController.text,
          "phone": hairDetail.phoneController.text,
        },
      });
      prompayData = PromtPayData.fromJson(data);
    } on RequestException catch (e) {
      print(e.toString());
    } finally {
      isLoad.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    generatePromtpay().then((value) {
      subscribeFireStore();
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
